COPY(SELECT XMLELEMENT(name warehouses, 
				XMLAGG(
					XMLELEMENT(name warehouse, 
						XMLELEMENT(name id, w.w_id),
                		XMLELEMENT(name name, w.w_name),
                		XMLELEMENT(name address, 
                			XMLELEMENT(name street, w.w_street),
                			XMLELEMENT(name city, w.w_city),
                			XMLELEMENT(name country, w.w_country),
                			XMLELEMENT(name stocks,
                				XMLELEMENT(name itemId, s.i_id)
                			)
                		)
                	)
                )
            )
FROM warehouse w, stock s
WHERE s.w_id = w.w_id
AND w.w_id=22) TO '/media/sf_labs_shared_folder/project3/qn1.xml'
