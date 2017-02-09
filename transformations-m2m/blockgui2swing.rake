model_to_model :BlockGUI_to_SWIGN do |t|
    
    t.sources
        :package => 'BlockGUI',
        :metamodel => '../metamodels/ecores/blockgui-MM.ecore',
        :model => '../models/blockgui.xmi'
    
    t.targets
        :package => 'SWING',
        :metamodel => '../metamodels/ecores/swing-metamodelo.ecore',
        :model => '../models/swing1-out.xmi'
      
    t.transformation 'base2swing.rb'
    
end
