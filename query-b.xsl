<!--Credit: how to find maximum attribute, https://stackoverflow.com/questions/8702039/how-to-find-the-max-attribute-from-an-xml-document-using-xpath-1-0-->
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>Question 3b - Warehouses</h2>  
  <xsl:apply-templates/>  
  </body>
  </html>
</xsl:template>

<xsl:template match="/warehouses">
  <p>
    <xsl:apply-templates select="warehouse[address/country='Singapore' or address/country='Malaysia']"/>
  </p>
</xsl:template>

<xsl:template match="warehouse">
  <b>Warehouse Name: <xsl:value-of select="name"/><br/></b>
  <xsl:apply-templates select="items/item[not(quantity &lt;= preceding-sibling::item/quantity) and not(quantity &lt;= following-sibling::item/quantity)]/item_name"/><br/>
  <p/> 

</xsl:template>



</xsl:stylesheet>

