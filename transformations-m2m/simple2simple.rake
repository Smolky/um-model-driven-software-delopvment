model_to_model :simple_to_simple do |t|
    
    t.sources
        :package => 'SIMPLE1',
        :metamodel => '../metamodels/ecores/simple.ecore',
        :model => '../models/simple1.xmi'
    
    t.targets
        :package => 'SIMPLE2',
        :metamodel => '../metamodels/ecores/simple.ecore',
        :model => '../models/swing1-out.xmi'
      
    t.transformation 'simple2simple.rb'
    
end
