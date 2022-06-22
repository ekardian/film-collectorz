<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- this template replaces the newlines in the text parameter with <br/, and outputs the < character un-escaped instead of &lt;
     and outputs the parameter -->
<xsl:template name="break">
 <xsl:param name="text"/>
 <xsl:choose>
     <xsl:when test="contains($text, '&lt;')">
        <xsl:call-template name="break">
          <xsl:with-param name="text" select="substring-before($text,'&lt;')"/>
       </xsl:call-template>
       <![CDATA[<]]>
       <xsl:call-template name="break">
         <xsl:with-param name="text" select="substring-after($text,'&lt;')"/>
       </xsl:call-template>
     </xsl:when>

     <xsl:when test="contains($text, '&gt;')">
        <xsl:call-template name="break">
          <xsl:with-param name="text" select="substring-before($text,'&gt;')"/>
       </xsl:call-template>
       <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
       <xsl:call-template name="break">
         <xsl:with-param name="text" select="substring-after($text,'&gt;')"/>
       </xsl:call-template>
     </xsl:when>

      <xsl:when test="contains($text, '&#13;&#10;')">
        <xsl:value-of select="substring-before($text,'&#13;&#10;')"/>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br/>]]></xsl:text>
        <xsl:call-template name="break">
           <xsl:with-param name="text" select="substring-after($text,'&#13;&#10;')"/>
        </xsl:call-template>
      </xsl:when>
     
     <xsl:otherwise>
         <xsl:value-of select="$text"/>
     </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<!-- process a lookup item -->
<xsl:template match="node()[displayname!='']">
	<xsl:variable name="prefix">
  <xsl:choose>
  		<xsl:when test="contains(url, 'http://') or contains(url, 'https://') or $templatetype !='view'"></xsl:when>
			<xsl:otherwise>http://local_</xsl:otherwise>
  	</xsl:choose>
	</xsl:variable>
	
  <xsl:choose>
    <xsl:when test="url!='' and $print=''">
      <a href="{$prefix}{url}" class="link"><xsl:value-of select="displayname"/></a>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="displayname"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="link">
	<xsl:variable name="prefix">
	  <xsl:choose>
  		<xsl:when test="contains(url, 'http://') or contains(url, 'https://') or $templatetype !='view'"></xsl:when>
			<xsl:otherwise>http://local_</xsl:otherwise>
  	</xsl:choose>
	</xsl:variable>

  <xsl:choose>
    <xsl:when test="description != ''">
      <a href="{$prefix}{url}" class="link"><xsl:value-of select="description"/></a>
    </xsl:when>
    <xsl:otherwise>
      <a href="{$prefix}{url}" class="link">Link</a>
    </xsl:otherwise>
  </xsl:choose>
  <br/>
</xsl:template>

<xsl:template name="extractfileextension">
  <xsl:param name="filepath" select="."/>
  <xsl:choose>
    <xsl:when test="substring-after($filepath, '.') != ''">
      <xsl:call-template name="extractfileextension">
        <xsl:with-param name="filepath" select="substring-after($filepath, '.')"/>
      </xsl:call-template>  
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$filepath"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="replace-string">
  <xsl:param name="text"/>
  <xsl:param name="replace"/>
  <xsl:param name="with"/>
  <xsl:choose>
    <xsl:when test="contains($text,$replace)">
      <xsl:value-of select="substring-before($text,$replace)"/>
      <xsl:value-of select="$with"/>
      <xsl:call-template name="replace-string">
        <xsl:with-param name="text" select="substring-after($text,$replace)"/>
        <xsl:with-param name="replace" select="$replace"/>
        <xsl:with-param name="with" select="$with"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$text"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="changecase">
<xsl:param name="text"/>
<xsl:param name="islower"/>
<xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
<xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

<xsl:choose>
  <xsl:when test="$islower = 0">
    <xsl:value-of select="translate($text,$lower,$upper)"/><!--make upper-->
  </xsl:when>  
  <xsl:otherwise> 
  <xsl:if test="$islower = 1">
    <xsl:value-of select="translate($text,$upper,$lower)"/><!--make lower-->
  </xsl:if>
  </xsl:otherwise>          
</xsl:choose>

</xsl:template> 

<xsl:template name="trailer">
  <xsl:param name="in_url" select="''"/>
	<xsl:param name="width" select="630"/>  
	<xsl:param name="height" select="400"/>  		
	<xsl:variable name="youtubelink">
  <xsl:choose>
  		<xsl:when test="contains($in_url, 'youtube.com/?')">
  			<xsl:value-of select="substring-after($in_url,'youtube.com/?')"/>
  		</xsl:when>
  		<xsl:when test="contains($in_url, 'youtube.com/watch?v=')">	
  			<xsl:value-of select="substring-after($in_url,'youtube.com/watch?v=')"/>
  		</xsl:when>  		
  		<xsl:when test="contains($in_url, 'youtu.be/')">
  			<xsl:value-of select="substring-after($in_url,'youtu.be/')"/>
  		</xsl:when>  		
			<xsl:otherwise></xsl:otherwise>
  	</xsl:choose>
	</xsl:variable>
  <!--<iframe class="youtube-player" type="text/html" width="{$width}" height="{$height}" src="http://www.youtube.com/embed/{$youtubelink}?html5=1" frameborder="0" allowfullscreen="1">
  </iframe>			-->
  <div class="embed-responsive embed-responsive-16by9">
    <iframe class="embed-responsive-item" src="http://www.youtube.com/embed/{$youtubelink}?html5=1" allowfullscreen="1"></iframe>
  </div>
</xsl:template>

</xsl:stylesheet>
