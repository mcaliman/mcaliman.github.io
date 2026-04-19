import csv
import yaml
import os
import re

def sanitize_key(key):
    if not key:
        return "empty"
    # Basic snake_case conversion
    key = key.lower()
    key = re.sub(r'[^a-z0-7]+', '_', key)
    key = key.strip('_')
    return key

if __name__ == "__main__":
    import sys
    current_dir = os.path.dirname(os.path.abspath(__file__))
    output_dir = os.path.join(current_dir, "..", "_data", "linkedin")
    
    target_csv = None
    if len(sys.argv) > 1:
        target_csv = sys.argv[1]
        if not target_csv.endswith(".csv"):
            target_csv += ".csv"
        print(f"Targeting single file: {target_csv}")

    for filename in os.listdir(current_dir):
        if filename.endswith(".csv"):
            if target_csv and filename != target_csv:
                continue
            
            csv_path = os.path.join(current_dir, filename)
            yml_filename = filename.replace(".csv", ".yml")
            yml_path = os.path.join(output_dir, yml_filename)
            
            print(f"Processing {filename}...")
            
            try:
                with open(csv_path, mode='r', encoding='utf-8-sig') as csv_file:
                    content = csv_file.read().strip()
                    if not content:
                        print(f"  Skipping {filename}: File is empty.")
                        continue
                    
                    # Use csv.Sniffer to check if it's a valid CSV or just text
                    try:
                        dialect = csv.Sniffer().sniff(content[:1024])
                        csv_file.seek(0)
                        reader = csv.DictReader(csv_file, dialect=dialect)
                    except Exception:
                        # Fallback for simple single-column or weird files
                        csv_file.seek(0)
                        reader = csv.DictReader(csv_file)

                    rows = list(reader)
                    if not rows:
                        # If no rows were found, treat the whole file as text content
                        data = {"text_content": content}
                    else:
                        # Standard CSV or list
                        data = []
                        for row in rows:
                            sanitized_row = {sanitize_key(k): v for k, v in row.items() if k is not None}
                            # Remove empty keys or None values
                            sanitized_row = {k: v for k, v in sanitized_row.items() if k and v}
                            if sanitized_row:
                                data.append(sanitized_row)
                        
                        if not data:
                            data = {"text_content": content}

                    with open(yml_path, 'w', encoding='utf-8') as yml_file:
                        yaml.dump(data, yml_file, allow_unicode=True, sort_keys=False)
                    print(f"  Created {yml_path}")
                    
            except Exception as e:
                print(f"  Error processing {filename}: {e}")
