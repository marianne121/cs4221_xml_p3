COPY(SELECT XMLELEMENT(name items,
        XMLAGG(
          XMLELEMENT(name item, 
            XMLELEMENT(name item_name, i.i_name),
            XMLELEMENT(name quantity, s.s_qty)
            )
        ))    
FROM warehouse w, item i, stock s
WHERE w.w_country = 'Singapore'
AND s.s_qty > 975
AND s.i_id = i.i_id) TO '/media/sf_labs_shared_folder/project3/q3.xml'

