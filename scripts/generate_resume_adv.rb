require 'yaml'
require 'caracal'

# Configuration
DATA_DIR = '_data/linkedin'
OUTPUT_FILE = 'Massimo_Caliman_Resume_Advanced.docx'

# Colors
COLOR_PRIMARY = '1C2833' # Navy Dark
COLOR_SECONDARY = '566573' # Dark Grey
COLOR_ACCENT = '2E86C1' # Light Blue
COLOR_WHITE = 'FFFFFF'
COLOR_SIDEBAR_BG = 'F4F6F7'

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
  docx.style id: 'HeaderName', name: 'Header Name', font: 'Century Gothic', size: 48, bold: true, color: COLOR_WHITE, align: :center
  docx.style id: 'HeaderTitle', name: 'Header Title', font: 'Century Gothic', size: 24, italic: true, color: 'D5DBDB', align: :center
  docx.style id: 'SidebarTitle', name: 'Sidebar Title', font: 'Century Gothic', size: 22, bold: true, color: COLOR_PRIMARY, caps: true
  docx.style id: 'MainTitle', name: 'Main Title', font: 'Century Gothic', size: 26, bold: true, color: COLOR_PRIMARY, bottom: 100
  docx.style id: 'ExperienceTitle', name: 'Experience Title', font: 'Georgia', size: 20, bold: true
  docx.style id: 'Normal', name: 'Normal', font: 'Georgia', size: 19, color: '333333'

  # --- HEADER SECTION ---
  header_data = [
    ["#{profile['first_name']} #{profile['last_name']}".upcase],
    [profile['headline']]
  ]
  docx.table header_data do
    cell_style cells, background: COLOR_PRIMARY, border_color: COLOR_PRIMARY, border_size: 0, padding: 10
    cell_style rows[0], size: 48, bold: true, color: COLOR_WHITE, align: :center
    cell_style rows[1], size: 24, italic: true, color: 'D5DBDB', align: :center
  end

  docx.p # Spacer

  # --- MAIN LAYOUT TABLE ---
  # We use a table with 2 columns: 1 for sidebar, 1 for main
  
  # Prepare Sidebar content
  sidebar = Caracal::Core::Models::TableCellModel.new do
    # Contact Info
    p 'CONTACT', style: 'SidebarTitle'
    p "📍 #{profile['geo_location']}"
    if profile['websites']
      sites = profile['websites'].gsub(/[\[\]]/, '').split(',')
      sites.each do |site|
        label, url = site.split(':', 2)
        p "🌐 #{label.strip}"
        p url.to_s.strip, size: 16, color: COLOR_ACCENT
      end
    end
    p

    # Skills
    p 'SKILLS', style: 'SidebarTitle'
    skills.map { |s| s['name'].strip }.each do |skill|
      p "• #{skill}", size: 18
    end
    p

    # Languages
    p 'LANGUAGES', style: 'SidebarTitle'
    languages.each do |lang|
      p "• #{lang['name']}", bold: true
      p lang['proficiency'], size: 16, italic: true
    end
    p

    # Education
    p 'EDUCATION', style: 'SidebarTitle'
    education.each do |edu|
      p edu['degree_name'], bold: true, size: 18
      p edu['school_name'], size: 16
      p "#{edu['start_date']} - #{edu['end_date']}", size: 16, italic: true
      p
    end
  end

  # Prepare Main Content
  main = Caracal::Core::Models::TableCellModel.new do
    # Summary
    if profile['summary']
      p 'PROFESSIONAL SUMMARY', style: 'MainTitle'
      p profile['summary']
      p
    end

    # Experience
    p 'EXPERIENCE', style: 'MainTitle'
    positions.each do |pos|
      p pos['title'], style: 'ExperienceTitle'
      p pos['company_name'], bold: true, color: COLOR_SECONDARY
      dates = "#{pos['started_on']} - #{pos['finished_on'].empty? ? 'Present' : pos['finished_on']}"
      p dates, italic: true, size: 18, color: '7F8C8D'
      if pos['description']
        p pos['description'], top: 100
      end
      p
    end

    # Certifications
    if certifications.any?
      p 'CERTIFICATIONS', style: 'MainTitle'
      certifications.first(15).each do |cert| # Limit top 15 to avoid overly long doc
        p "• #{cert['name']}", bold: true
        p "  #{cert['authority']} | #{cert['started_on']}", size: 16, italic: true
      end
    end
  end

  # Create the layout table
  # Column 0: Sidebar (width 30%), Column 1: Main (width 70%)
  docx.table [[sidebar, main]] do
    cell_style cells, border_size: 0, padding: 20
    cell_style cols[0], width: 3000, background: COLOR_SIDEBAR_BG
    cell_style cols[1], width: 7000
  end
end

puts "Advanced resume generated successfully: #{OUTPUT_FILE}"
