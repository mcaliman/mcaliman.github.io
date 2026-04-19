require 'yaml'
require 'caracal'

# Configuration
DATA_DIR = '_data/linkedin'
OUTPUT_FILE = 'Massimo_Caliman_Resume_Europass.docx'

# Europass Colors
EU_BLUE = '004494'
EU_GREY = '5E5E5E'
EU_LIGHT_GREY = 'F2F2F2'

def load_yaml(filename)
  path = File.join(DATA_DIR, filename)
  return [] unless File.exist?(path)
  begin
    YAML.load_file(path)
  rescue => e
    puts "Error loading #{filename}: #{e.message}"
    []
  end
end

# Load data
profile = load_yaml('Profile.yml').first || {}
positions = load_yaml('Positions.yml')
education = load_yaml('Education.yml')
skills = load_yaml('Skills.yml')
languages = load_yaml('Languages.yml')
certifications = load_yaml('Certifications.yml')

# Initialize Caracal Document
Caracal::Document.save OUTPUT_FILE do |docx|
  # Page setup
  docx.page_margins do
    left    720
    right   720
    top     720
    bottom  720
  end

  # Styles
  docx.style id: 'EuName', name: 'Europass Name', font: 'Arial', size: 36, bold: true, color: EU_BLUE
  docx.style id: 'EuSection', name: 'Europass Section', font: 'Arial', size: 22, bold: true, color: EU_BLUE, caps: true, top: 200, bottom: 100
  docx.style id: 'EuLabel', name: 'Europass Label', font: 'Arial', size: 18, bold: true, color: EU_GREY
  docx.style id: 'EuText', name: 'Europass Text', font: 'Arial', size: 18, color: '000000'
  docx.style id: 'EuDate', name: 'Europass Date', font: 'Arial', size: 18, italic: true, color: EU_GREY

  # --- HEADER / PERSONAL INFO ---
  personal_info = Caracal::Core::Models::TableCellModel.new do
    p "#{profile['first_name']} #{profile['last_name']}", style: 'EuName'
    p "CURRICULUM VITAE", size: 20, color: EU_GREY, bold: true
    p
    p "📍 [Inserisci Via e Civico], #{profile['zip_code']} #{profile['geo_location']}", style: 'EuText'
    p "📧 [Inserisci Email]", style: 'EuText'
    p "🌐 https://trueprogramming.com", style: 'EuText'
    p "📅 Data di nascita: #{profile['birth_date']} | Sesso: Maschile | Nazionalità: Italiana", style: 'EuText'
  end

  # Header Table
  docx.table [[personal_info]] do
    cell_style cells, border_size: 0, padding: 10
  end
  docx.hr color: EU_BLUE, size: 8

  # --- MAIN CONTENT ---
  
  # Helper to create a two-column row for experience/education
  def add_eu_row(docx, left_content, right_title, right_subtitle, right_desc = nil)
    row_data = [
      Caracal::Core::Models::TableCellModel.new { p left_content, style: 'EuDate', align: :right },
      Caracal::Core::Models::TableCellModel.new do
        p right_title, style: 'EuLabel'
        p right_subtitle, style: 'EuText', bold: true
        p right_desc, style: 'EuText' if right_desc
      end
    ]
    docx.table [row_data] do
      cell_style cells, border_size: 0, padding_top: 10
      cell_style cols[0], width: 2500
      cell_style cols[1], width: 7500
    end
  end

  # Professional Summary
  docx.p "ESPERIENZA PROFESSIONALE", style: 'EuSection'
  positions.each do |pos|
    dates = "#{pos['started_on']} – #{pos['finished_on'].empty? ? 'Attuale' : pos['finished_on']}"
    add_eu_row(docx, dates, pos['title'], pos['company_name'], pos['description'])
  end

  # Education
  docx.p "ISTRUZIONE E FORMAZIONE", style: 'EuSection'
  education.each do |edu|
    dates = "#{edu['start_date']} – #{edu['end_date']}"
    add_eu_row(docx, dates, edu['degree_name'], edu['school_name'])
  end

  # Skills
  docx.p "COMPETENZE PERSONALI", style: 'EuSection'
  
  # Languages
  docx.table [[Caracal::Core::Models::TableCellModel.new { p "Lingua madre", style: 'EuLabel', align: :right }, 
               Caracal::Core::Models::TableCellModel.new { p "Italiano", style: 'EuText' }]] do
    cell_style cells, border_size: 0
    cell_style cols[0], width: 2500
  end

  docx.p "Altre lingue", style: 'EuLabel', indent_left: 2500
  lang_rows = [
    ['Lingua', 'Ascolto', 'Lettura', 'Produzione', 'Interazione', 'Scrittura']
  ]
  languages.each do |lang|
    next if lang['name'].downcase == 'italiano'
    # Using B1 as requested by user
    lang_rows << [lang['name'], 'B1', 'B1', 'B1', 'B1', 'B1']
  end
  
  lang_grid = Caracal::Core::Models::TableCellModel.new do
    table lang_rows, border_size: 1 do
      cell_style cells, padding: 5, size: 16, align: :center
      cell_style rows[0], bold: true, background: EU_LIGHT_GREY
      cell_style cols[0], bold: true, align: :left
    end
  end

  docx.table [[nil, lang_grid]] do
    cell_style cells, border_size: 0
    cell_style cols[0], width: 2500
    cell_style cols[1], width: 7500
  end
  docx.p

  # Digital Skills
  docx.table [[Caracal::Core::Models::TableCellModel.new { p "Competenze digitali", style: 'EuLabel', align: :right }, 
               Caracal::Core::Models::TableCellModel.new { 
                 p skills.map{|s| s['name']}.first(20).join(' | '), style: 'EuText' 
               }]] do
    cell_style cells, border_size: 0
    cell_style cols[0], width: 2500
  end

  # Certifications
  if certifications.any?
    docx.p "INFORMAZIONI SUPPLEMENTARI", style: 'EuSection'
    cert_text = certifications.first(10).map { |c| "• #{c['name']} (#{c['authority']})" }.join("\n")
    add_eu_row(docx, "Certificazioni", "Corsi e Certificati", nil, cert_text)
  end

  docx.p
  docx.p "Autorizzo il trattamento dei miei dati personali ai sensi del Dlgs 196 del 30 giugno 2003 e dell'art. 13 GDPR.", size: 14, italic: true
end

puts "Europass resume generated successfully: #{OUTPUT_FILE}"
