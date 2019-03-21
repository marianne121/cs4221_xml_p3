-- References: http://itworkedonmymachine.blogspot.com/2012/04/nesting-multiple-levels-with-xmlelement.html

COPY(SELECT XMLELEMENT(name warehouses,
				XMLAGG(
					XMLELEMENT(name warehouse, 
						XMLELEMENT(name id, w.w_id),
            XMLELEMENT(name name, w.w_name),
            XMLELEMENT(name address, 
              XMLELEMENT(name street, w.w_street),
              XMLELEMENT(name city, w.w_city),
              XMLELEMENT(name country, w.w_country)
            ),
            XMLELEMENT(name items, 
              (SELECT XMLAGG(XMLELEMENT(name item, 
                  XMLELEMENT(name item_id, i.i_id),
                  XMLELEMENT(name im_id, i.i_im_id),
                  XMLELEMENT(name item_name, i.i_name),
                  XMLELEMENT(name price, i.i_price),
                  XMLELEMENT(name quantity, s.s_qty)
                ))
              FROM stock s, item i
              WHERE s.w_id = w.w_id
              AND s.i_id = i.i_id)
            )
          )
        ))    
FROM warehouse w) TO '/media/sf_labs_shared_folder/project3/q1.xml'
