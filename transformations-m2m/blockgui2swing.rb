transformation 'blockgui2swign'

# Base2Swign model
# ----------------------------------------------------------------------
# 
# This transformation will convert BLOCKGUI models provided in the 
# exercice 1 to SWING models using RubyTL transformations 
#  
# 
# Requirements
# - Create a SWIGN model from a BASEGUI model
# - Create JPanels blocks with associated layout (horizontal or vertical)
# - Leaf panels are formed only for widgets and "flow" type
# - Each panel will have a deep value
# - Properties can include global properties for all elements
#   with the same deep except exists a specific rule for the
#   block
# - A list with a set of items will become a ListModel list with
#   items defined on a string
# - A gap is a block
# - Other mappins are direct
# 
# 
# OCL Restrictions
# - Can't exists two colours with the same name
# - RGB values have to be between 0 and 255
# - A menu bar can't contain the same name twice
# - A window can't have to buttons with the same name
# - A list can't have to items with the same name
# - A window can't have more than four fonts
# - The deepest level will be no superior to 4
# - A border can't have another borders
# 

# Create definitions
phase 'definitions' do

  # Colors. Create global definition for RGB colors
  top_rule 'colors' do
    from BlockGUI::Color 
    to SWING::Color
    mapping do |origin, destiny| do
      destiny.R = origin.R
      destiny.G = origin.G
      destiny.B = origin.B
      destiny.name = |origin.name
    end
  end
    
  
  # Fonts
  top_rule 'fonts' do
    from BlockGUI::Font
    to SWING::Font
    mapping do |origin, destiny| do
      destiny.family = origin.family
      destiny.name = origin.name
      destiny.size = origin.size
            
      # Pepe: From ENUM to String
      destiny.style = origin.style
    end 
  end
end


# Layout phase. This phase will create the layout
phase 'layout' do

  # Top rule. All magic starts here
  top_rule 'GUIDefinition2SwingModel' do
  
    # From a simple root element to another simple root element 
    from BlockGUI::GUIDefinition
    to SWING::SwingModel
      
    mapping do |gui_definition, swing_model| do
      
      # Apply the same name
      swing_model.name = gui_definition.name
      
      
      # Views: View2Window
      swing_model.windows = gui_definition.views 
          
    end
  end
  
  
  # This rule will transform view to windows
  rule 'View2Window' do
    from GUIDefinition::view
    to SWING::JFrame
  
    mapping do |view, frame, panel| do
      
      // Start the panel
      panel.level = 0;
      
      // Doubt
      // panel.border = ...
      panel.layout
      panel.target = 
      
      
      // Bind frame
      frame.contentPane = panel;
      
      
      // Defining frame name
      frame.name = view.title
          
    end
  end
end