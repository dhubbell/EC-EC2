<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ec2="http://ec2.amazonaws.com/doc/2010-06-15/" exclude-result-prefixes="ec2">
  <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>
  <xsl:variable name="ns" select="'http://ec2.amazonaws.com/doc/2010-06-15/'"/>
  <xsl:template match="AttachVolumeResponse">
    <xsl:element name="AttachVolumeResponse" namespace="{$ns}">
      <xsl:element name="ResponseMetadata" namespace="{$ns}">
        <xsl:element name="RequestId" namespace="{$ns}">
          <xsl:value-of select="requestId"/>
        </xsl:element>
      </xsl:element>
      <xsl:element name="AttachVolumeResult" namespace="{$ns}">
        <xsl:element name="Attachment" namespace="{$ns}">
          <xsl:element name="VolumeId" namespace="{$ns}">
            <xsl:value-of select="volumeId"/>
          </xsl:element>
          <xsl:element name="InstanceId" namespace="{$ns}">
            <xsl:value-of select="instanceId"/>
          </xsl:element>
          <xsl:element name="Device" namespace="{$ns}">
            <xsl:value-of select="device"/>
          </xsl:element>
          <xsl:element name="Status" namespace="{$ns}">
            <xsl:value-of select="status"/>
          </xsl:element>
          <xsl:element name="AttachTime" namespace="{$ns}">
            <xsl:value-of select="attachTime"/>
          </xsl:element>
          <xsl:element name="DeleteOnTermination" namespace="{$ns}">
            <xsl:if test="string-length(deleteOnTermination) = 0">false</xsl:if>
            <xsl:if test="string-length(deleteOnTermination) > 0">
              <xsl:value-of select="deleteOnTermination"/>
            </xsl:if>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
