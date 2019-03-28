<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>Warehouses</h2>  
  <xsl:apply-templates/>  
  </body>
  </html>
</xsl:template>

<xsl:template match="/warehouses">
  <p>
    <xsl:apply-templates select="warehouse[address/country='Singapore' and items/item[quantity&gt;975]]"/>
      
  </p>
</xsl:template>

<xsl:template match="warehouse">
  <b>Warehouse Name: <xsl:value-of select="name"/><br/></b>
  <xsl:apply-templates select="items/item[quantity&gt;975]"/> 

</xsl:template>

<xsl:template match="item">
  Item Name: <xsl:value-of select="item_name"/><br/>
  Quantity: <xsl:value-of select="quantity"/><br />
  <p/>
</xsl:template>

</xsl:stylesheet>

