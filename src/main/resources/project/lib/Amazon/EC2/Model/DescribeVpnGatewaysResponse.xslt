<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ec2="http://ec2.amazonaws.com/doc/2010-06-15/"
	exclude-result-prefixes="ec2">
	<xsl:output method="xml" omit-xml-declaration="no" indent="yes" />
	<xsl:variable name="ns"
		select="'http://ec2.amazonaws.com/doc/2010-06-15/'" />
	<xsl:template match="DescribeVpnGatewaysResponse">
		<xsl:element name="DescribeVpnGatewaysResponse" namespace="{$ns}">
			<xsl:element name="ResponseMetadata" namespace="{$ns}">
				<xsl:element name="RequestId" namespace="{$ns}">
					<xsl:value-of select="requestId" />
				</xsl:element>
			</xsl:element>
			<xsl:element name="DescribeVpnGatewaysResult" namespace="{$ns}">
				<xsl:apply-templates select="vpnGatewaySet" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="vpnGatewaySet">
		<xsl:for-each select="item">
			<xsl:element name="VpnGateway" namespace="{$ns}">
				<xsl:element name="VpnGatewayId" namespace="{$ns}">
					<xsl:value-of select="vpnGatewayId" />
				</xsl:element>
				<xsl:element name="VpnGatewayState" namespace="{$ns}">
					<xsl:value-of select="state" />
				</xsl:element>
				<xsl:element name="Type" namespace="{$ns}">
					<xsl:value-of select="type" />
				</xsl:element>
				<xsl:element name="AvailabilityZone" namespace="{$ns}">
					<xsl:value-of select="availabilityZone" />
				</xsl:element>
				<xsl:apply-templates select="attachments" />
			</xsl:element>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="attachments">
		<xsl:for-each select="item">
			<xsl:element name="VpcAttachment" namespace="{$ns}">
				<xsl:element name="VpcId" namespace="{$ns}">
					<xsl:value-of select="vpcId" />
				</xsl:element>
				<xsl:element name="VpcAttachmentState" namespace="{$ns}">
					<xsl:value-of select="state" />
				</xsl:element>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
