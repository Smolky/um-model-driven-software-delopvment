transformation 'simple2simple'

# Simple2Simple
top_rule 'Simple2Simple' do

    # From a simple root element to another simple root element 
    from SIMPLE1::Root
    to SIMPLE2::Root
    
    # Mapping rules
    mapping do |simple1, simple2| do
        simple1.name = simple2.name
        
        # As elements are from the same type
        # no further rules are needed
        simple1.elements = simple2.elements
    end
    
end
