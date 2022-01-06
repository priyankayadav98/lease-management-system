<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<!-- TODO: Auto-generated template -->
		<html>
			<body>
				<h2 style="text-align:center;">HOUSE RENTAL MANAGEMENT</h2>
				<h3 style="text-align:center;">TENANT</h3>
				<table border="2" align="center">
					<tr>
						<th>Name</th>
						<th>Age</th>
						<th>NO_MEMBER</th>
						<th>ID</th>
					</tr>
					<xsl:for-each select="rental/Tenant">
						<tr>
							<td>
								<xsl:value-of select="Name"></xsl:value-of>
							</td>
							<td>
								<xsl:value-of select="Age"></xsl:value-of>
							</td>
							<td>
								<xsl:value-of select="NO_MEMBER"></xsl:value-of>
							</td>
							<td>
								<xsl:value-of select="ID"></xsl:value-of>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h3 style="text-align:center;">OWNER</h3>
				<table border="2" align="center">
					<tr>
						<th>Name</th>
						<th>No_building</th>
						<th>ID</th>
					</tr>
					<xsl:for-each select="rental/Owner">
					<xsl:sort select="ID">
					</xsl:sort>
						<tr>
							<td>
								<xsl:value-of select="Name"></xsl:value-of>
							</td>
							<td>
								<xsl:value-of select="No_building"></xsl:value-of>
							</td>
							<td>
								<xsl:value-of select="ID"></xsl:value-of>
							</td>
						</tr>
					</xsl:for-each>
					</table>
					<h3 style="text-align:center;">CONTRACT</h3>
				<table border="2" align="center">
					<tr>
						<th>ID</th>
						<th>Years</th>
						<th>Do_registration</th>
						<th>Security</th>
					</tr>
					<xsl:for-each select="rental/Contract">
					<xsl:if test = "Security  &gt; 3000">
				
						<tr>
							<td>
								<xsl:value-of select="ID"></xsl:value-of>
							</td>
				
                             <td>
								<xsl:value-of select="Years"></xsl:value-of>
							</td>
							<td>
								<xsl:value-of select="Do_registration"></xsl:value-of>
							</td>
							
							<td>
								<xsl:value-of select="Security"></xsl:value-of>
							</td>
						</tr>
						</xsl:if>
					</xsl:for-each>
					</table>
					<h3 style="text-align:center;">FURNISHING</h3>
				<table border="2" align="center">
					<tr>
						<th>Type</th>
						<th>No_pieces</th>
						<th>date</th>
						
					</tr>
					<xsl:for-each select="rental/Contract">
				     <tr>
							<td><xsl:value-of select="date" /></td>
                            <xsl:choose>
                            <xsl:when test="No_pieces &gt; 3">
                            <td bgcolor="#ff00ff">
                            <xsl:value-of select="Type"/></td>
                            </xsl:when>
				            <xsl:otherwise>
                                <td><xsl:value-of select="No_pieces"/></td>
                                </xsl:otherwise>
                                </xsl:choose>
						</tr>
					</xsl:for-each>
					</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
		
		
		
		
		
		
		
		
		
		