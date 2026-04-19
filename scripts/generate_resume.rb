require 'yaml'
require 'caracal'

# Configuration
DATA_DIR = '_data/linkedin'
OUTPUT_FILE = 'Massimo_Caliman_Resume.docx'

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
  # Page margins
  docx.page_margins do
    left    720
    right   720
    top     720
    bottom  720
  end

  # Header
  docx.h1 "#{profile['first_name']} #{profile['last_name']}" do
    align :center
    bold  true
  end
  docx.p profile['headline'] do
    align :center
    italic true
    color '666666'
  end
  
  contact_info = [profile['geo_location']]
  if profile['websites']
    # Websites are stored as a string like "[BLOG:https://trueprogramming.com,OTHER:https://juggenova.it]"
    sites = profile['websites'].gsub(/[\[\]]/, '').split(',')
    sites.each do |site|
      label, url = site.split(':', 2)
      contact_info << "#{label}: #{url}"
    end
  end
  
  docx.p contact_info.join(' | ') do
    align :center
    size  18
  end

  docx.hr

  # Professional Summary
  if profile['summary']
    docx.h2 'Professional Summary' do
      bold true
    end
    docx.p profile['summary']
    docx.p
  end

  # Experience
  docx.h2 'Professional Experience' do
    bold true
  end
  positions.each do |pos|
    docx.p do
      text pos['title'], bold: true, size: 24
      text " at ", bold: false
      text pos['company_name'], bold: true, size: 24
    end
    
    dates = "#{pos['started_on']} - #{pos['finished_on'].empty? ? 'Present' : pos['finished_on']}"
    docx.p dates do
      italic true
      color '666666'
    end
    
    if pos['description']
      docx.p pos['description']
    end
    docx.p
  end

  # Education
  docx.h2 'Education' do
    bold true
  end
  education.each do |edu|
    docx.p do
      text edu['degree_name'], bold: true
      text " | ", bold: false
      text edu['school_name']
    end
    docx.p "#{edu['start_date']} - #{edu['end_date']}" do
      italic true
    end
  end
  docx.p

  # Skills
  docx.h2 'Skills' do
    bold true
  end
  skill_names = skills.map { |s| s['name'].strip }
  docx.p skill_names.join(', ')
  docx.p

  # Certifications
  if certifications.any?
    docx.h2 'Certifications' do
      bold true
    end
    certifications.each do |cert|
      docx.p do
        text cert['name'], bold: true
        text " by #{cert['authority']}"
      end
      docx.p "Issued: #{cert['started_on']}" do
        size 16
        italic true
      end
    end
  end

  # Languages
  if languages.any?
    docx.p
    docx.h2 'Languages' do
      bold true
    end
    lang_info = languages.map { |l| "#{l['name']} (#{l['proficiency']})" }
    docx.p lang_info.join(' | ')
  end
end

puts "Resume generated successfully: #{OUTPUT_FILE}"
