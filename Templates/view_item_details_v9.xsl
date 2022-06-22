<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>

<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
<xsl:output method="html"/>

<xsl:param name="pageheight">200</xsl:param>
<xsl:param name="pagewidth">400</xsl:param>
<xsl:param name="templatetype">view</xsl:param>
<xsl:param name="absolutelinks">true</xsl:param>
<xsl:param name="stylesheet">view_item_details_blue.css</xsl:param>
<xsl:param name="mybasepath"></xsl:param>

<xsl:include href="shared_templates.xsl"/>

<!-- handle myrating field - set stars -->
<xsl:template name="star">
  <xsl:param name="num" select="0"/>
  	<xsl:variable name="rating">
			<xsl:choose>
			   <xsl:when test="contains($num, '%')">
						<xsl:variable name="percentage">			   
			         <xsl:value-of select="substring-before($num,'%')"/>
						</xsl:variable>
						<xsl:value-of select="$percentage div 10"/>
			   </xsl:when>
			   <xsl:otherwise>		
			       <xsl:value-of select="$num"/>
			   </xsl:otherwise>
			</xsl:choose>
	</xsl:variable>
  <xsl:choose>
    <xsl:when test="$templatetype!='exportdetails'">	
      <a href="http://editrating.html"><img src="{$mybasepath}rating{$rating}.png" border="0"/></a>
    </xsl:when>
    <xsl:otherwise>
      <span class="fieldvaluelarge">  
        <xsl:value-of select="$rating"/>*
      </span>
    </xsl:otherwise>    
  </xsl:choose>     
</xsl:template>

<!-- crew -->
<xsl:template name="personimages">
    <xsl:param name="roleid" select="dfProducer"/>
    <xsl:if test="crew/crewmember[./role[@id=$roleid]]!=''">
	    <!-- <tr>
	    <td nowrap="1" class="role image"> --><li>
	       <xsl:value-of select="/movieinfo/moviemetadata/field[@id=$roleid]/@label"/>
	    <!-- </td>
	    <td class="person narrow">
            <table class="person-list"> --><ul>
            <xsl:for-each select="crew/crewmember[./role[@id=$roleid]]">
                <!-- <tr class="crew-member">
                <td class="person"> --><li>
                    <xsl:apply-templates select="person"/>
                <!-- </td>
                <td class="picture"> -->
                <xsl:choose>
                    <xsl:when test="person/imageurl!=''">
                        <xsl:call-template name="personimagelink">
                            <xsl:with-param name="nameimglink" select="person/imageurl"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="person/templateimage!=''">
                         <xsl:call-template name="personimagelink">
                           <xsl:with-param name="nameimglink" select="person/templateimage"/>
                         </xsl:call-template>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- </td>
                </tr> --></li>
                <xsl:if test="position()!=last()"><xsl:text></xsl:text></xsl:if>
             </xsl:for-each>
            <!-- </table>
          </td>
        </tr> --></ul></li>
    </xsl:if>
</xsl:template>


<xsl:template name="crewrole">
  <xsl:param name="roleid" select="dfProducer"/>
    <xsl:if test="crew/crewmember[./role[@id=$roleid]]!=''">
      <!-- <tr>
         <td nowrap="1" class="role"> --><li>
           <xsl:value-of select="/movieinfo/moviemetadata/field[@id=$roleid]/@label"/>
         <!-- </td>
         <td class="person"> -->
            <xsl:for-each select="crew/crewmember[./role[@id=$roleid]]">                        
                <xsl:apply-templates select="person"/><br />
              <xsl:if test="position()!=last()"><xsl:text></xsl:text></xsl:if>
            </xsl:for-each>
         <!-- </td>
      </tr> --></li>
    </xsl:if>
</xsl:template>

<!-- crew episodes -->
<xsl:template name="crewrole2">
  <xsl:param name="roleid" select="dfProducer"/>
    <xsl:if test="crew/crewmember[./role[@id=$roleid]]!=''">
           <b><xsl:value-of select="/movieinfo/moviemetadata/field[@id=$roleid]/@label"/>:</b>&nbsp;
            <xsl:for-each select="crew/crewmember[./role[@id=$roleid]]">
                <xsl:apply-templates select="person"/>&nbsp;
              <xsl:if test="position()!=last()"><xsl:text>/&nbsp;</xsl:text></xsl:if>
            </xsl:for-each>
    </xsl:if>
</xsl:template>

<!-- backdrop / poster-->
<xsl:template name="backdropposter">
  <xsl:param name="nameimg" select="''"/>
  <xsl:if test="$templatetype='view' or 'print'">
    <xsl:if test="$nameimg!=''">
      <a href="http://image.html"><img src="file:///{$nameimg}" border="0" style="height:150px;"/></a>
    </xsl:if>
  </xsl:if>
</xsl:template>

<!-- episode image -->
<xsl:template name="imagelinkep">
  <xsl:param name="nameimglink" select="''"/>
  <xsl:if test="$templatetype='view'">
    <xsl:if test="$nameimglink!=''">
      <a href="http://episode.html"><img src="{$nameimglink}" border="0" style="width:100px;"/></a>
    </xsl:if>
  </xsl:if>
</xsl:template>

<!-- personal image -->
<xsl:template name="personimagelink">
  <xsl:param name="nameimglink" select="''"/>
  <xsl:if test="$templatetype='view'">
    <xsl:if test="$nameimglink!=''">
      <a href="http://personimage.html"><img class="personheadshot" src="{$nameimglink}" border="0"/></a>
    </xsl:if>
  </xsl:if>
</xsl:template>


<xsl:template name="boxsetcover">
  <xsl:param name="name" select="''"/>

  <xsl:if test="$templatetype='view'">
    <xsl:if test="$name!=''">
    <div id="boxsetcover">
      <a href="http://image.html"><img src="file:///{$name}" border="0" class="coverimage"/></a>   
    </div>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="imdblink">
  <xsl:choose>
    <xsl:when test="$templatetype!='exportdetails'"><img src="{$mybasepath}imdblogo.gif" border="0" alt=""/></xsl:when>
    <xsl:otherwise>IMDB</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="cover">
  <xsl:param name="in_viewhref" select="''"/>
  <xsl:param name="in_cover" select="''"/>
  <xsl:param name="in_id" select="''"/>
  <xsl:param name="in_postfix" select="''"/>

  <xsl:choose>
    <xsl:when test="$templatetype='view'">
       <a href="{$in_viewhref}">
         <img src="file:///{$in_cover}" border="0" class="coverimage"/>
       </a>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
       <xsl:when test="$absolutelinks = 'true'">
         <a href="$in_cover"><img src="file:///{$in_cover}" class="coverimage"/></a>
       </xsl:when>
       <xsl:otherwise>
         <xsl:variable name="extf"><xsl:call-template name="extractfileextension"><xsl:with-param name="filepath" select="$in_cover"/></xsl:call-template></xsl:variable>
<!--Original code for cover-->
          <!--<a href="../images/{$in_id}{$in_postfix}.{$extf}"><img src="https://googledrive.com/host/0B4IL_NIjd8oWfmNwdUZQX1pkV3ZWaDl5cmQxUW1CU2J3RW1EdXBZWm4xQ19acDNXWTQtTUk/{$in_id}{$in_postfix}.{$extf}" class="coverimage"/></a>-->
<!--End Original code for cover-->         
<!--to local cover-->         
         <a href="../images/{$in_id}{$in_postfix}.{$extf}"><img src="../images/{$in_id}{$in_postfix}.{$extf}" class="coverimage"/></a>
<!--end to local cover-->
<!--to web cover-->         
         <!-- <img src="http://s1268.photobucket.com/user/clipscontenido/library/images/{$in_id}{$in_postfix}.{$extf}" class="coverimage"/> -->
<!--end to web cover-->         
       </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="collection_status">
  <xsl:param name="in_listid" select="''"/>
  <xsl:param name="in_status" select="''"/>

  <xsl:choose>
    <xsl:when test="$templatetype='view'">
      <img src="{$mybasepath}ic_{$in_listid}_24.png" alt="" border="0"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$in_status"/><br/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="imagelink">
  <xsl:param name="in_viewhref" select="''"/>
  <xsl:param name="in_url" select="''"/>
  
	<xsl:variable name="prefix">
  <xsl:choose>
  		<xsl:when test="contains(in_url, 'http://')"></xsl:when>
			<xsl:otherwise>file:///</xsl:otherwise>
  	</xsl:choose>
	</xsl:variable>
	
  <xsl:choose>
    <xsl:when test="$templatetype='view'">
      <a href="{$in_viewhref}"><img src="{$prefix}{$in_url}" border="0" class="imagefile" /></a>
    </xsl:when>
    <xsl:otherwise>
      <a href="file:///{$in_url}"><img src="file:///{$in_url}" class="imagefile"/></a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="plot">
	<xsl:call-template name="break"><xsl:with-param name="text" select=".\"/></xsl:call-template> 
</xsl:template>

<!-- the main template -->
<xsl:template match="/">
<html>
  <HEAD>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>    
    <LINK REL="StyleSheet" TYPE="text/css" HREF="{$mybasepath}{$stylesheet}"></LINK>
    <link rel="icon" type="image/x-icon" href="images/biosfilm.ico" />
    <link rel="stylesheet" href="../css/bootstrap.css"/>
    <link rel="stylesheet" href="..css/bootstrap-theme.css"/>
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
    <meta property="og:title" content="InfoContenido: http://info.biosxtreme.net" />
    <meta property="og:url" content="http://film.biosxtreme.net/" />
    <meta property="og:type" content="website" />
    <meta property="og:description" content="Películas - Documentales - Videotutoriales - Películas Cristianas - Películas Cristianas infantiles - Películas motivacionales" />
    <meta property="og:image" content="http://film.biosxtreme.net/images/filmbiosxtreme.jpg" />
	 <TITLE>
    <xsl:value-of select="movieinfo/movielist/movie/title"/>
		<xsl:if test="movieinfo/movielist/movie/titleextension!=''">
      <xsl:text> - </xsl:text>
      <xsl:value-of select="movieinfo/movielist/movie/titleextension"/>
    </xsl:if>
    <xsl:if test="movieinfo/movielist/movie/originaltitle!=''">
      <xsl:value-of select="movieinfo/movielist/movie/originaltitle"/>
    </xsl:if>
    <xsl:if test="movieinfo/movielist/movie/releasedate!=''">
      <xsl:choose>
        <xsl:when test="movieinfo/movielist/movie/releasedate/date!=''">    
          <xsl:text></xsl:text>&#160;(<xsl:value-of select="movieinfo/movielist/movie/releasedate/date"/>)
        </xsl:when>          
        <xsl:otherwise>    
          <xsl:text></xsl:text>&#160;(<xsl:value-of select="movieinfo/movielist/movie/releasedate/year"/>)
        </xsl:otherwise>          
      </xsl:choose>      
    </xsl:if>    
    </TITLE>
  </HEAD>
  <BODY onload="initPage();">
    <div class="container-fluid">      
    <xsl:apply-templates select="movieinfo/navigation"/>
    <xsl:apply-templates select="movieinfo/movielist"/>    
    </div>
  </BODY>
</html>  
</xsl:template>

<xsl:template match="movie">
  <xsl:if test="$stylesheet='view_item_details_blue_v8.css'"> 
	 	<xsl:variable name="apos">'</xsl:variable>
		<xsl:variable name="fixedbackdrop">
			<xsl:call-template name="replace-string">
				<xsl:with-param name="text" select="backgroundbackdrop"/>
				<xsl:with-param name="replace" select="$apos"/>				
				<xsl:with-param name="with" select="concat('\', $apos)"/>				
			</xsl:call-template>
		</xsl:variable> 
	  <xsl:if test="backgroundbackdrop!=''">
	    <style type="text/css">
			body {background:url('<xsl:value-of select="$fixedbackdrop"/>');background-size:100%;background-attachment:fixed;}	    
			</style>
	  </xsl:if>
  </xsl:if>	
  
  <xsl:if test="boxset!=''">
		<div id="#" class="#">
      <xsl:call-template name="boxsetcover"><xsl:with-param name="name" select="boxset/frontcover"/></xsl:call-template>
      <xsl:call-template name="boxsetcover"><xsl:with-param name="name" select="boxset/backcover"/></xsl:call-template>
			<span id="#"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfBoxSet']/@label"/>:&nbsp;<xsl:value-of select="boxset/displayname"/></span>
      <!-- <table class="valuestable" border="0" cellspacing="0" cellpadding="0"> --><ul>
	      <xsl:if test="boxset/upc!=''">
	         <!--<tr valign="top">-->
	          <li><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfUPC']/@label"/><xsl:value-of select="boxset/upc"/>
	         </li>
	      </xsl:if>
	      <xsl:if test="boxset/releasedate!=''">
	         <!--<tr valign="top">-->
	          <li><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfDVDReleaseDate']/@label"/><xsl:value-of select="boxset/releasedate/date"/>
	         </li>
	      </xsl:if>
	      <xsl:if test="boxset/purchasedate!=''">
	         <!--<tr valign="top">-->
	          <li><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfPurchaseDate']/@label"/><xsl:value-of select="boxset/purchasedate/date"/>
	         </li>>
	      </xsl:if>
	      <xsl:if test="boxset/purchaseprice!=''">
	         <!--<tr valign="top">-->
	          <li><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfPurchasePrice']/@label"/><xsl:value-of select="boxset/purchaseprice"/>
	         </li>>
	      </xsl:if>
	      <xsl:if test="boxset/store!=''">
	         <!--<tr valign="top">-->
	          <li><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfStore']/@label"/><xsl:value-of select="boxset/store/displayname"/>
	         </li>>
	      </xsl:if>
	      <xsl:if test="boxset/condition!=''">
	         <!--<tr valign="top">-->
	          <li><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfCondition']/@label"/><xsl:value-of select="boxset/condition/displayname"/>
	         </li>
	      </xsl:if>
	      <xsl:if test="boxset/currentvalue!=''">
	         <!--<tr valign="top">-->
	          <li><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfCurrentValue']/@label"/><xsl:value-of select="boxset/currentvalue"/>
	         </li>
	      </xsl:if>
			<!-- </table> --></ul>
		  <xsl:if test="boxset/notes!=''">
				<div id="notes">
		    <xsl:call-template name="break">
		      <xsl:with-param name="text" select="boxset/notes"/>
		    </xsl:call-template>
				</div>
		  </xsl:if>
		</div>
	<hr/>
  </xsl:if>
<!-- VER DETALLES MOVIE -->
<ul id="bxt1">
  <li id="dm1">
      <span id="#">Título:&nbsp;<xsl:value-of select="title"/>
          <xsl:if test="titleextension!=''">
            <xsl:text> - </xsl:text><xsl:value-of select="titleextension"/>
          </xsl:if>
      </span>
  </li>
  <li id="cbxt1">
    
     <xsl:choose>    
	    <xsl:when test="coverfront!=''">
	    <div id="frontcover">
	      <xsl:call-template name="cover">
	        <xsl:with-param name="in_viewhref">http://front.html</xsl:with-param>
	        <xsl:with-param name="in_cover" select="coverfront"/>
	        <xsl:with-param name="in_id" select="id"/>
	        <xsl:with-param name="in_postfix">f</xsl:with-param>
	      </xsl:call-template>
	    </div>
	    </xsl:when>
	    <xsl:otherwise>
		    <div id="frontcover">
		    	<a href="http://searchcover.html">
		    		<img src="{$mybasepath}coverplaceholder.png" border="0" class="coverimage"/>
		    	</a>
		    </div>
	    </xsl:otherwise>
    </xsl:choose>
    
    
	<ul id="dm1_2">
<!--Título-->
	  <!-- <li>
		   <span id="movietitle">Título:&nbsp;
			  <xsl:value-of select="title"/>
		     <xsl:if test="titleextension!=''">
             <xsl:text> - </xsl:text>
             <xsl:value-of select="titleextension"/>
           </xsl:if>
       </span>
		 </li> -->
	  <li>
<!--Género-->
	    <li><span id="subs">Género:</span>&nbsp;
		   <xsl:if test="genres!=''">
           <xsl:for-each select="genres/genre">
           <xsl:value-of select="displayname"/>
           <xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
           </xsl:for-each>
	      </xsl:if>
		 </li>		  
<!--resolucion video-->          
		<xsl:if test="/movieinfo/movielist/movie/userdefinedvalues/userdefinedvalue/lookupitem/displayname!=''">
         <li>
			 <span id="subs">Calidad&#160;:&#160;
			 </span>
          <xsl:value-of select="/movieinfo/movielist/movie/userdefinedvalues/userdefinedvalue/lookupitem/displayname"/>&#160;&#160;
<!--Duracion-->          
		 <xsl:if test="runtimeminutes!=''">
		      <span id="subs">Duración:</span>&nbsp;<xsl:value-of select="runtimeminutes"/>&nbsp;
		 </xsl:if><br/>                   
         </li>       
         </xsl:if>
<!--Pista de Audio-->         
		<xsl:if test="audios/audio!=''">
        <li>
            <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfAudio']/@label"/>:&nbsp;&nbsp;</span>
          
  			   <xsl:for-each select="audios/audio">
				  <xsl:value-of select="displayname"/><br/>
		   	</xsl:for-each>
          
        </li>
      </xsl:if>	       
<!--Formato--> 
		<li>
       <span id="subs">Formato:</span>&nbsp;
       <xsl:if test="format/displayname!=''">
		   <xsl:value-of select="format/displayname"/>&nbsp;
      </xsl:if>
      </li>
<!--Estudio-->         		  
		   <span id="subs">Estudio:</span>&nbsp;
           <xsl:if test="studios!=''">
			    <xsl:for-each select="studios/studio">
	            <xsl:value-of select="displayname"/>
	            <xsl:if test="position()!=last()"><xsl:text> / </xsl:text></xsl:if>
    	       </xsl:for-each>
           </xsl:if>
           <xsl:if test="releasedate!=''">
             <xsl:choose>
             <xsl:when test="releasedate/date!=''">    
               <xsl:text></xsl:text>&#160;(<xsl:value-of select="releasedate/date"/>)
             </xsl:when>          
             <xsl:otherwise>    
               <xsl:text></xsl:text>&#160;(<xsl:value-of select="releasedate/year"/>)
             </xsl:otherwise>          
             </xsl:choose>      
           </xsl:if>
		 </li>
<!--Colección-->
<!--	    <li>
		   <div style="#"><xsl:if test="collectionstatus !=''">
           <xsl:call-template name="collection_status">
           <xsl:with-param name="in_listid" select="collectionstatus/@listid"/>
           <xsl:with-param name="in_status" select="collectionstatus"/>
           </xsl:call-template>
         </xsl:if>
         <xsl:if test="index!='0'"><span id="indexvalue" class="#">#<xsl:value-of select="index"/></span></xsl:if></div>
		 </li>-->
<!-- visto si no - imdb -->
	    <li>
	     <!--<table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td valign="top">
			   <div style="margin-top:4px;" class="export">
              <xsl:if test="$templatetype='view' and (links//*[urltype='Movie']!='')"><a href="http://playall.html"><img src="{$mybasepath}playthemovie.png" style="float:left;border:none;margin-right:7px;margin-top:6px;" /></a></xsl:if>	
				  <b style="font-weight:normal;"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfSeenIt']/@label"/></b>:&nbsp;
              <xsl:choose>
	             <xsl:when test="viewingdate/date!='' and seenwhere!=''">
	           	   <b><xsl:value-of select="seenit"/></b><br/>(<xsl:value-of select="viewingdate/date"/>&#160;<xsl:value-of select="seenwhere"/>)
	             </xsl:when>		
	             <xsl:when test="seenwhere!=''">
	               <b><xsl:value-of select="seenit"/></b><br/>(<xsl:value-of select="seenwhere"/>)
	             </xsl:when>			           
	             <xsl:when test="viewingdate/date!=''">
	               <b><xsl:value-of select="seenit"/></b><br/>(<xsl:value-of select="viewingdate/date"/>)
	             </xsl:when>	
	             <xsl:otherwise>	
	               <b><xsl:value-of select="seenit"/></b>
				    </xsl:otherwise>
              </xsl:choose>				
				<xsl:if test="upc!=''"><br /><b><xsl:value-of select="upc"/></b></xsl:if>
            </div>
				</td>
		      <td valign="top">
				<div style="float:right;margin-top:7px;margin-bottom:2px;margin-left:20px;">
				  <xsl:if test="imdbnum!='' and imdbnum!='0'">
                <span style="margin-top:0px;"><a href="{imdburl}"><xsl:call-template name="imdblink"/></a></span>
              </xsl:if>
			     <xsl:if test="imdbrating!='' and imdbrating!='0' and imdbrating!='0.0'">
		          <i style="font-size:12pt;" class="imdb" title="IMDb">&nbsp;<b><a href="{imdburl}" class="imdb"><xsl:value-of select="imdbrating"/></a></b></i>
              </xsl:if>
            </div>
			   </td>
				</tr></table>-->
<!--Duración - idioma-->
	     <ul>
				<li>
<!--					
			   <xsl:if test="runtimeminutes!=''">
				   <span id="subs">Duración:</span>&nbsp;<xsl:value-of select="runtimeminutes"/>&nbsp;
				</xsl:if><br/>-->
                <xsl:choose>
                    <xsl:when test="country/templateimage!='' and $templatetype!='exportdetails'"><img><xsl:attribute name="src"><xsl:value-of select="country/templateimage"/></xsl:attribute></img></xsl:when>
                    <xsl:otherwise>
				        <xsl:if test="country!=''"><span id="subs">Pais:</span>&nbsp;<xsl:value-of select="country/displayname"/></xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="language/templateimage!='' and $templatetype!='exportdetails' ">&nbsp;/&nbsp;<img><xsl:attribute name="src"><xsl:value-of select="language/templateimage"/></xsl:attribute></img></xsl:when>
                    <xsl:otherwise>
				        <xsl:if test="language!=''">&nbsp;/&nbsp;<span id="subs">Idioma:</span>&nbsp;<xsl:value-of select="language/displayname"/></xsl:if><br/>
                    </xsl:otherwise>
                </xsl:choose>
		   
		   </li><li>
		    
   <xsl:if test="$templatetype!='exportdetails'">
				<xsl:choose>		
				  <xsl:when test="format/templateimage!=''">
				    <span style="margin-right:7px;">
				      <img><xsl:attribute name="src"><xsl:value-of select="format/templateimage"/></xsl:attribute></img>
				    </span>
				  </xsl:when>
				  <xsl:otherwise>
				    <xsl:value-of select="format/displayname"/>&nbsp;
				  </xsl:otherwise>
				</xsl:choose>	
  			   <xsl:for-each select="regions/region">
				  <xsl:choose>
				    <xsl:when test="templateimage!=''">
				       <span style="margin-right:7px;">
				         <img><xsl:attribute name="src"><xsl:value-of select="templateimage"/></xsl:attribute></img>
				       </span>
				    </xsl:when>
				    <xsl:otherwise>
				      <xsl:value-of select="displayname"/>
				        <xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>&nbsp;
				    </xsl:otherwise>
				  </xsl:choose>
		   	</xsl:for-each>
				<xsl:choose>		
				  <xsl:when test="mpaarating/templateimage!=''">
				    <span style="margin-right:7px;">
				      <img><xsl:attribute name="src"><xsl:value-of select="mpaarating/templateimage"/></xsl:attribute></img>
				    </span>
				  </xsl:when>
				  <xsl:otherwise>
				    <b><xsl:value-of select="mpaarating/displayname"/></b>
				  </xsl:otherwise>
				</xsl:choose>
     </xsl:if>
<!--Formato - Región-->
     <xsl:if test="$templatetype='exportdetails'">
<!--       <span id="subs">Formato:</span>&nbsp;
       <xsl:if test="format/displayname!=''">
		   <xsl:value-of select="format/displayname"/>&nbsp;
      </xsl:if><br/>-->
<!--       
       <xsl:if test="regions/region!=''"><span id="subs">Región:</span>&nbsp;
  	      <xsl:for-each select="regions/region">
			  <xsl:value-of select="displayname"/>
			  <xsl:if test="position()!=last()"><xsl:text>,&nbsp;</xsl:text></xsl:if>
			</xsl:for-each> 
       </xsl:if><br/>-->
<!-- Clasificacion -->	 
<!--       <xsl:if test="mpaarating/displayname!=''">
         <span id="subs">Clasificación:</span>&nbsp;<xsl:value-of select="mpaarating/displayname"/>
       </xsl:if><br/> -->
<!-- Added para ID  -->
<!--    <li>
      
        <span class="#"><span id="subs">ID:</span>&nbsp;
            <xsl:if test="id!='0'"><span id="indexvalue" class="#">#<xsl:value-of select="id"/></span></xsl:if>
        </span>
      
    </li>-->
<!--Mi valoración-->
	<!--<li>
		   <xsl:if test="myrating!=''">
           <div style="#"><span id="subs">Valoración:</span>&nbsp;<xsl:call-template name="star"><xsl:with-param name="num" select="myrating"/></xsl:call-template><span class="glyphicon glyphicon-star"></span></div> 
         </xsl:if>
	</li>-->                     
     </xsl:if>
			    </li>
			  </ul>
		   </li> 
		 </ul>
    
<!-- Cover trasero -->    
<!--  <xsl:if test="coverback!=''">
    <div id="backcover">
      <xsl:call-template name="cover">
        <xsl:with-param name="in_viewhref">http://back.html</xsl:with-param>
        <xsl:with-param name="in_cover" select="coverback"/>
        <xsl:with-param name="in_id" select="id"/>
        <xsl:with-param name="in_postfix">b</xsl:with-param>
      </xsl:call-template>
    </div>
  </xsl:if> -->
    
  </li>
</ul>
<!--equipo y dirección -->
  <!-- <div style="clear:both;">	 -->

	 <!--<span style="float:left;" class="opacity">
	 <xsl:if test="cast!=''">
      <table class="valuestable" border="0" cellspacing="1" cellpadding="0">
        <xsl:for-each select="cast/star">
          <tr>
            <td nowrap="1">
          	<xsl:choose>          		
				  		<xsl:when test="person/imageurl!=''">
                 <xsl:call-template name="personimagelink">
                   <xsl:with-param name="nameimglink" select="person/imageurl"/>
                 </xsl:call-template>
							</xsl:when>
          		<xsl:otherwise>
							<xsl:if test="person/templateimage!=''">
               <xsl:call-template name="personimagelink">
                 <xsl:with-param name="nameimglink" select="person/templateimage"/>
               </xsl:call-template>
		            </xsl:if>
                    <xsl:if test="person/templateimage=''and $templatetype='view'">
					  <img class="actorheadshot" src="{$mybasepath}actorhead.png" border="0"/>
		            </xsl:if>		            
		          </xsl:otherwise>
		        </xsl:choose>							             
            </td>
            <td class="castactor" nowrap="1">
				  <xsl:apply-templates select="person"/>
				</td>
            <td class="castcharacter">
				  <xsl:if test="character!=''"><xsl:value-of select="character"/></xsl:if>
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </xsl:if>
	 </span>-->
<!-- Director y equipo técnico -->
	 <!-- <span style="float:left;margin-left:25px;" class="opacity">
	 <xsl:if test="crew!=''">
      <ul>
      	<xsl:call-template name="personimages"><xsl:with-param name="roleid">dfDirector</xsl:with-param></xsl:call-template>        
        <xsl:call-template name="crewrole"><xsl:with-param name="roleid">dfProducer</xsl:with-param></xsl:call-template>
        <xsl:call-template name="crewrole"><xsl:with-param name="roleid">dfWriter</xsl:with-param></xsl:call-template>
        <xsl:call-template name="crewrole"><xsl:with-param name="roleid">dfCamera</xsl:with-param></xsl:call-template>
        <xsl:call-template name="crewrole"><xsl:with-param name="roleid">dfMusic</xsl:with-param></xsl:call-template>
        <xsl:call-template name="crewrole"><xsl:with-param name="roleid">dfUserCredit1</xsl:with-param></xsl:call-template>
        <xsl:call-template name="crewrole"><xsl:with-param name="roleid">dfUserCredit2</xsl:with-param></xsl:call-template>
      </ul>
     </xsl:if>
	 </span> -->
<!-- </div> -->

<div style="clear:both;">
<span style="float:left;">
  <xsl:if test="$templatetype='view'">
    <xsl:if test="links!=''">
    <xsl:if test="links//*[urltype='Trailer URL']!=''">    
      <div style="float:left;margin-top:2px;width:305px;margin-right:5px;" id="trailers">            
	     <xsl:for-each select="links//*[urltype='Trailer URL']"><p/>	     
		    <xsl:call-template name="trailer">        
		      <xsl:with-param name="in_url" select="url"/>
					<xsl:with-param name="width" select="300"/>		      
					<xsl:with-param name="height" select="200"/>		      
		    </xsl:call-template>
		  </xsl:for-each> 
      </div>
    </xsl:if>
    </xsl:if>
    </xsl:if>
 </span>

<xsl:if test="$templatetype='view'">
 <xsl:if test="plot!=''"><br/>
   <div style="font-size:130%;text-align:justify;margin-bottom:10px;" class="opacity marginbackdrop">
     <xsl:call-template name="break"><xsl:with-param name="text" select="plot"/></xsl:call-template>    
   </div>
 </xsl:if>
</xsl:if>

<xsl:if test="$templatetype='print'">
 <xsl:if test="plot!=''"><br/>
   <div style="font-size:8pt;text-align:justify;margin-bottom:10px;" class="opacity marginbackdrop">
     <xsl:call-template name="break"><xsl:with-param name="text" select="plot"/></xsl:call-template>    
   </div>
 </xsl:if>
</xsl:if>

<!--Trailer-->
<xsl:if test="$templatetype='exportdetails'">
  <ul id="bxt2">
  <li id="dm3">Trailer</li>
  <!--<td valign="top">-->
  <xsl:if test="links!=''">
  <xsl:if test="links//*[urltype='Trailer URL']!=''">
    <!--<div style="margin-top:2px;width:305px;margin-right:5px;" id="trailers">-->
    <div id="tclip">
	   <xsl:for-each select="links//*[urltype='Trailer URL']"><!--<p/>-->
		  <xsl:call-template name="trailer">        
				<xsl:with-param name="width" select="480"/>		      
				<xsl:with-param name="height" select="360"/>			  
		    <xsl:with-param name="in_url" select="url"/>
		  </xsl:call-template>
		</xsl:for-each> 
    </div>
    <!--</div>-->
  </xsl:if>
  </xsl:if>
  <!--</td>-->

<!--Plot Detalles-->
  <li id="dm2">Trama</li>
    <xsl:if test="plot!=''">
      <!-- <div style="padding: 5px;text-align:justify;"> -->
      <div id="cbxt2">
      <xsl:call-template name="break"><xsl:with-param name="text" select="plot"/></xsl:call-template>
	     </div>
    </xsl:if>
  </ul>
</xsl:if>
</div>
<!-- Episodios -->
   <!-- <div style="clear:both;">	 -->
    <xsl:if test="count(discs/disc/episodes/episode) > 0">
      <xsl:variable name="episodecount">
        <xsl:value-of select="count(discs/disc/episodes/episode)"/>
      </xsl:variable>
      <div id="episodes">
        <div id="dm3"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttEpisodeDetails']/@label"/></div>
		  <xsl:for-each select="discs/disc">
          <xsl:if test="count(episodes/episode) > 0">
              <ul id="cbxt3">
              <li>
				<xsl:if test="count(episodes/episode)!=$episodecount">
              <b><i><xsl:value-of select="title"/></i></b>
            </xsl:if>
				      </li>
				<xsl:for-each select="episodes/episode">
			       <li>
 <!-- view and export -->   <xsl:if test="$templatetype!='print'">
						  <span style="float:right;">
	             <xsl:choose>
						    <xsl:when test="seenit/@boolvalue='1'">
							    <xsl:choose>
							    	<xsl:when test="$templatetype!='exportdetails'">
							      	&nbsp;&nbsp;<img src="{$mybasepath}seenyes.png" border="none" title="Seen it: Yes"/>&nbsp;
							      </xsl:when>
							      <xsl:otherwise>
							      	&nbsp;&nbsp;&nbsp;&nbsp;Visto: Si&nbsp;
							      </xsl:otherwise>
							    </xsl:choose>
								<xsl:if test="viewingdate/date!=''">
								  &nbsp;<i><xsl:value-of select="viewingdate/date"/></i>
								</xsl:if>
								<xsl:if test="seenwhere!=''">								
								  <i>&nbsp;@&nbsp;<xsl:value-of select="seenwhere"/></i>&nbsp;
								</xsl:if>
						    </xsl:when>
							 <xsl:otherwise>
							 </xsl:otherwise>
		              </xsl:choose>						  
						    <xsl:if test="runtime!=''">
							   &nbsp;<xsl:value-of select="runtime"/>&nbsp;
							 </xsl:if>
						    <xsl:if test="firstairdate/date!=''">
							   &nbsp;<b><xsl:value-of select="firstairdate/date"/></b>&nbsp;
							 </xsl:if> 
						    <xsl:if test="$templatetype='view'">
							   <xsl:if test="imdburl!=''">
							     &nbsp;<a><xsl:attribute name="href"><xsl:value-of select="imdburl"/></xsl:attribute><img src="{$mybasepath}imdbepisode.png" border="none"/></a>&nbsp;
							   </xsl:if>
							 </xsl:if>
						    <xsl:if test="$templatetype!='exportdetails'">
							   <xsl:if test="movielink!=''">	
                          &nbsp;<a href="http://playepisode_{movielink}.html" class="link">
							       <img src="{$mybasepath}playepisode.png" border="none" title="Play Episode"/>
                          </a>&nbsp;
                        </xsl:if>
                      </xsl:if>
                    </span>
						  <b class="episodestitle"><xsl:value-of select="sequencenumber"/>.</b>&nbsp;
						  <xsl:choose>
                      <xsl:when test="link!=''">
								<a class="episodefont"><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><b class="episodestitle"><xsl:value-of select="title"/></b></a>
                      </xsl:when>
                      <xsl:otherwise>
                        <b class="episodestitle"><xsl:value-of select="title"/></b>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>
 <!-- print -->   <xsl:if test="$templatetype='print'">
					    <b class="episodestitle"><xsl:value-of select="sequencenumber"/>.</b>&nbsp;
                   <b class="episodestitle"><xsl:value-of select="title"/></b>
						    <xsl:if test="runtime!=''">
							   &nbsp;&nbsp;<xsl:value-of select="runtime"/>&nbsp;
							 </xsl:if>
						    <xsl:if test="firstairdate/date!=''">
							   &nbsp;<b><xsl:value-of select="firstairdate/date"/></b>&nbsp;
							 </xsl:if> 
		              <xsl:choose>
						    <xsl:when test="seenit/@boolvalue='1'">
						      &nbsp;&nbsp;Visto: Si
						    </xsl:when>
							 <xsl:otherwise>
							 </xsl:otherwise>
		              </xsl:choose>						  			 
                  </xsl:if>
					 </li>
					 <li>
                <xsl:if test="$templatetype!='exportdetails'">
							<xsl:if test="image!=''">
		                 <xsl:call-template name="imagelinkep">
		                   <xsl:with-param name="nameimglink" select="image"/>
		                 </xsl:call-template>
		               </xsl:if>
					   
                 </xsl:if>
                 <xsl:if test="$templatetype='exportdetails'">					  
                   
						 <xsl:if test="image">
                     <img><xsl:attribute name="src"><xsl:value-of select="image"/></xsl:attribute></img>
                   </xsl:if>
						 
                 </xsl:if>
						  <xsl:if test="plot!=''"><div style="margin-top:5px;text-align:justify;" class="plot"><xsl:apply-templates select="plot"/></div></xsl:if>
						 <xsl:if test="crew!='' or cast!=''">
						  <div style="xmargin-top:3px;">
							 <ul>
							 <xsl:if test="crew!=''">
							 <li>
                        <span class="episodecredits"><xsl:call-template name="crewrole2"><xsl:with-param name="roleid">dfDirector</xsl:with-param></xsl:call-template>
                        <xsl:call-template name="crewrole2"><xsl:with-param name="roleid">dfWriter</xsl:with-param></xsl:call-template></span>
                      </li>
                      </xsl:if>
						    <xsl:if test="cast!=''">
							 <li>
							   <span class="episodecredits"><b>Guest starring:</b>&nbsp;
                        <xsl:for-each select="cast/star"><xsl:apply-templates select="person"/><xsl:if test="position()!=last()"><xsl:text>,&nbsp;</xsl:text></xsl:if></xsl:for-each></span>
                      </li>
						    </xsl:if>
                      </ul>
						  </div>
						 </xsl:if>
						  
			       </li>
            </xsl:for-each>	
		        </ul>	 	
          </xsl:if>
        </xsl:for-each>
      </div>
    </xsl:if>
   <!-- </div> -->

  <div style="clear:both;">
    <ul id="bxt4">
      <li id="dm4">Detalles y Características</li>
      <li id="cbxt4">
    <div id="editiondetails" class="marginbackdrop">
      <ul>
       <li><span id="subs1"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttProductDetails']/@label"/></span></li>
      <xsl:if test="edition!=''">
            <li>
           <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfEdition']/@label"/>:&nbsp;&nbsp;</span>
           <xsl:value-of select="edition/displayname"/>
         </li>
      </xsl:if>
	   <xsl:if test="originaltitle!=''">
         <li>
           <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfOriginalTitle']/@label"/>:&nbsp;&nbsp;</span>
           <xsl:value-of select="originaltitle"/>
         </li>
      </xsl:if>			
		<xsl:if test="series!=''">
          <li>
            <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfSeries']/@label"/>:&nbsp;&nbsp;</span>
            <xsl:value-of select="series/displayname"/>
          </li>
      </xsl:if>
      <xsl:if test="distributor!=''">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfDistributor']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="distributor/displayname"/>
         </li>
      </xsl:if>
      <xsl:if test="chapters!='' and chapters!='0'">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfChapters']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="chapters"/>
         </li>
      </xsl:if>
      <xsl:if test="dvdreleasedate!=''">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfDVDReleaseDate']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="dvdreleasedate/date"/>
         </li>
      </xsl:if>
<!--embalaje-->      
<!--      <xsl:if test="package!=''">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfPackage']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="package/displayname"/>
         </li>
      </xsl:if>-->
<!--radio-pantalla-aspecto-->      
      <xsl:if test="ratios/ratio!=''">
        <li>
            <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfRatio']/@label"/>:&nbsp;&nbsp;</span>
          
             <xsl:for-each select="ratios/ratio">
               <xsl:value-of select="displayname"/>
               <xsl:if test="position()!=last()"><br/></xsl:if>
             </xsl:for-each>
          
        </li>
      </xsl:if>
<!--Subtitulos-->      
      <xsl:if test="subtitles/subtitle!=''">
        <li>
            <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfSubtitles']/@label"/>:&nbsp;&nbsp;</span>
          
             <xsl:for-each select="subtitles/subtitle">
               <xsl:value-of select="displayname"/>
               <xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
             </xsl:for-each>
          
        </li>
      </xsl:if>      
<!--pista de audio-->      
      <xsl:if test="$templatetype!='exportdetails'">
		<xsl:if test="audios/audio!=''">
        <li>
            <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfAudio']/@label"/>:&nbsp;&nbsp;</span>
          
  			   <xsl:for-each select="audios/audio">
				  <xsl:choose>
				    <xsl:when test="templateimage!=''">
 	 			      <img><xsl:attribute name="src"><xsl:value-of select="templateimage"/></xsl:attribute></img>
                  &nbsp;<xsl:value-of select="displayname"/><br/>
				    </xsl:when>
				    <xsl:otherwise>
				      <xsl:value-of select="displayname"/><br/>
				    </xsl:otherwise>
				  </xsl:choose>
		   	</xsl:for-each>
          
        </li>
      </xsl:if>
      </xsl:if>
      <xsl:if test="$templatetype='exportdetails'">
<!--PIstas de Audio -->
<!--		<xsl:if test="audios/audio!=''">
        <li>
            <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfAudio']/@label"/>:&nbsp;&nbsp;</span>
          
  			   <xsl:for-each select="audios/audio">
				  <xsl:value-of select="displayname"/><br/>
		   	</xsl:for-each>
          
        </li>
      </xsl:if>		-->
      </xsl:if>
<!--numero de discos-->      		
<!--      <xsl:if test="layersnum!='' and layersnum!='4'">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfLayers']/@label" />:&nbsp;&nbsp;</span>
          <xsl:value-of select="layers" />
         </li>
      </xsl:if>
      <xsl:if test="nritems!=''">
        <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfNrItems']/@label" />:&nbsp;&nbsp;</span>
          <xsl:value-of select="nritems"/>
         </li>
      </xsl:if>-->
      <xsl:if test="extras!=''">
         <li>
              <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfExtras']/@label"/>:&nbsp;&nbsp;</span>
            
               <xsl:for-each select="extras/extra">
                 <xsl:value-of select="displayname"/>
                 <xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
               </xsl:for-each>
            
         </li>
     </xsl:if>
     </ul>
   </div>	
 
<!--Otros-->
   <div id="personaldetails" class="marginbackdrop">
      <ul>
       <!--<li id="subs1"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttPersonalDetails']/@label"/></li>-->
       <!-- reemplazado Detalles Personal por Otros-->
       <li id="subs1">Otros</li>
      <xsl:if test="purchasedate!=''">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfPurchaseDate']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="purchasedate/date"/>
         </li>
      </xsl:if>
		<xsl:if test="loan/loanedto!=''">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfLoaner']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="loan/loanedto/displayname"/>&#160;@&#160;<xsl:value-of select="loan/loandate/date"/>
         </li>
      </xsl:if>
<!--Localización-->      
<!-- LOCALIZACION DESACTIVADA -->
<!--	<xsl:if test="location!=''">
         <li>          
	    <span id="subs">LCT&nbsp;:&nbsp;&nbsp;</span>
          <xsl:value-of select="location/displayname"/>
         </li>
      </xsl:if>-->
<!--		<xsl:if test="owner!=''">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfOwner']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="owner/displayname"/>
         </li>
      </xsl:if>		
		<xsl:if test="store!=''">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfStore']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="store/displayname"/>
         </li>
      </xsl:if>-->
<!--precio-->      
      <!--<xsl:if test="purchaseprice!=''">
         <tr valign="top">
          <td class="fieldlabel" nowrap="1"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfPurchasePrice']/@label"/></td>
          <td class="fieldvalue"><xsl:value-of select="purchaseprice"/></td>
         </tr>
      </xsl:if>-->
      <xsl:if test="condition!=''">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfCondition']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="condition/displayname"/>
         </li>
      </xsl:if>
      <xsl:if test="currentvalue!=''">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfCurrentValue']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="currentvalue"/>
         </li>
      </xsl:if>
      <xsl:if test="quantity>'1'">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfQuantity']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="quantity"/>
         </li>
      </xsl:if>
      <xsl:if test="tapelabel!=''">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfTapeLabel']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="tapelabel/displayname"/>
         </li>
      </xsl:if>      
      <xsl:if test="tapespeed/@listid!='0'">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfTapeSpeed']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="tapespeed"/>
         </li>
      </xsl:if>
      <xsl:if test="startpos!=''">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfStartPos']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="startpos"/>
         </li>
      </xsl:if>
      <xsl:if test="tags!=''">
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfTag']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:for-each select="tags/tag">
             <xsl:value-of select="displayname"/>
             <xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
           </xsl:for-each>
         </li>
      </xsl:if>
      <xsl:if test="userlookup1!=''"> 
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfUserLookup1']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:apply-templates select="userlookup1"/>
         </li>
      </xsl:if>
      <xsl:if test="userlookup2!=''"> 
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfUserLookup2']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:apply-templates select="userlookup2"/>
         </li>
      </xsl:if>
      <xsl:if test="usertext1!=''"> 
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfUserText1']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="usertext1"/>
         </li>
      </xsl:if>
      <xsl:if test="usertext2!=''"> 
         <li>
          <span id="subs"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfUserText2']/@label"/>:&nbsp;&nbsp;</span>
          <xsl:value-of select="usertext2"/>
         </li>
       </xsl:if>
<!-- Enlaces -->      
      <xsl:if test="links!=''">
        <xsl:if test="links//*[urltype='URL']!=''">
         <li>
          <!-- reemplazado enlace por incluye-->
          <!--<td class="fieldlabel" nowrap="1"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfLinks']/@label"/></td>-->
          <span id="subs1">Incluye</span>
          
            <xsl:apply-templates select="links//*[urltype='URL']"/>
          
         </li>
        </xsl:if>
        <!--<xsl:if test="links//*[urltype='Trailer']!=''">
         <tr valign="top">
          <td class="fieldlabel" nowrap="1">Trailer Links</td>
          <td class="fieldvalue">
            <xsl:apply-templates select="links//*[urltype='Trailer']"/>
          </td>
         </tr>
        </xsl:if>
        <xsl:if test="$absolutelinks = 'true'">
        <xsl:if test="(links//*[urltype='Movie']!='')">
         <tr valign="top">
          <td class="fieldlabel" nowrap="1"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfMovieLinks']/@label"/></td>
          <td class="fieldvalue">
            <xsl:apply-templates select="(links//*[urltype='Movie'])"/>
          </td>
         </tr>
        </xsl:if>
        <xsl:if test="(links//*[urltype='Other']!='')">
         <tr valign="top">
          <td class="fieldlabel" nowrap="1"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfOtherLinks']/@label"/></td>
          <td class="fieldvalue">
            <xsl:apply-templates select="(links//*[urltype='Other'])"/>
          </td>
         </tr>
        </xsl:if>
        </xsl:if>	  -->
      </xsl:if>
      <xsl:if test="count(discs/disc/storageslot) > 0 or count(discs/disc/storagedevice) > 0">
        <xsl:for-each select="discs/disc">
          <xsl:if test="storageslot!='' or storagedevice/displayname!=''">
            <xsl:if test="position()=1">   
              <li><br/><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfStorageDevice']/@label"/></li>          
            </xsl:if>
            <li>
              <xsl:value-of select="title"/>
              <xsl:value-of select="storagedevice/displayname"/>:&#160;<xsl:value-of select="storageslot"/>
            </li>
          </xsl:if>
        </xsl:for-each>
     </xsl:if>
     </ul>
   </div>
  </li>
  <li id="cbxt5">
     <xsl:if test="count(discs/disc/features/feature) > 0 or count(discs/disc/extrafeatures) > 0">
       <div id="features" class="marginbackdrop">
         <p/>
         <!-- <div class="header extraheaderfeat"> --><span id="subs1"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfFeatures']/@label"/></span><!-- </div> -->
           <ul>
           <xsl:for-each select="discs/disc">
             <xsl:if test="features!='' or extrafeatures!=''">
               <li>
                 <xsl:if test="count(../disc) > 1">
                   <xsl:value-of select="title"/>
                 </xsl:if>
                 <xsl:if test="features/feature!=''">
                   <xsl:for-each select="features/feature">
                     <xsl:value-of select="displayname"/><br/>
                   </xsl:for-each>
                 </xsl:if>
                 
                 <xsl:if test="extrafeatures!=''">
						 <xsl:call-template name="break">
                     <xsl:with-param name="text" select="extrafeatures"/>
                   </xsl:call-template>
                 </xsl:if>
                 
               </li>
             </xsl:if>
           </xsl:for-each>
         </ul>
       </div>
    </xsl:if>
  
  </li>
</ul>

<div style="float:left;margin-right:5px;margin-top:5px;">
  <xsl:if test="$absolutelinks = 'true'">
    <xsl:if test="links!=''">
      <xsl:if test="links//*[urltype='Image']!=''">
      <div id="imagefiles">
        <!-- <div class="header opacity" style="font-size:10pt;"> --><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttImageLinkDetails']/@label"/><!-- </div> -->
          <xsl:for-each select="links//*[urltype='Image']">
            <xsl:call-template name="imagelink">
              <xsl:with-param name="in_viewhref">http://image.html</xsl:with-param>
              <xsl:with-param name="in_url" select="url"/>
            </xsl:call-template>
          </xsl:for-each>
      </div>
      </xsl:if>
      </xsl:if>
    </xsl:if>
</div>
<xsl:if test="$templatetype!='exportdetails'">
<xsl:if test="poster!=''">
  <div style="float:left;margin-right:5px;margin-top:5px;">
    <div class="header opacity" style="font-size:10pt;">Movie Poster</div>
		<xsl:if test="poster!=''">
		  <xsl:call-template name="backdropposter">
		    <xsl:with-param name="nameimg" select="poster"/>
		  </xsl:call-template>
		</xsl:if>
  </div>
</xsl:if>
<xsl:if test="backdropurl!=''">
  <div style="float:left;margin-right:5px;margin-top:5px;">
    <div class="header opacity" style="font-size:10pt;">Backdrop</div>	
		  <xsl:call-template name="backdropposter">
		    <xsl:with-param name="nameimg" select="backdropurl"/>
		  </xsl:call-template>
  </div>
</xsl:if>
</xsl:if>
<!-- NOTAS -->
<!--<xsl:if test="notes!=''">
      <br/>
	<div id="bxt6"><div id="dm6"><xsl:value-of select="/movieinfo/moviemetadata/field[@id='dfNotes']/@label"/></div>
      <div id="cbxt6"><xsl:call-template name="break">
        <xsl:with-param name="text" select="notes"/>
      </xsl:call-template></div>
	</div>
</xsl:if>-->
  </div>	
<xsl:if test="position()!=last()">
  <p style="page-break-before: always">&nbsp;</p>
</xsl:if>  
</xsl:template>

<xsl:template match="navigation">
 <nav class="text-center">
    <ul class="pagination">
      <xsl:choose>
        <xsl:when test="firstlink/@url!=''">
          <!-- <div class="navlink" id="first"><a href="{firstlink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttFirst']/@label"/></a></div> -->
          <li><a href="{firstlink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttFirst']/@label"/></a></li>
        </xsl:when>
        <xsl:otherwise>
          <!-- <div class="navlink" id="first"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttFirst']/@label"/></div> -->
          <li><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttFirst']/@label"/></li>
        </xsl:otherwise>
      </xsl:choose>   
      <xsl:choose>
        <xsl:when test="prevlink/@url!=''">
          <!-- <div class="navlink" id="prev"><a href="{prevlink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttPrev']/@label"/></a></div> -->
          <li><a href="{prevlink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttPrev']/@label"/></a></li>
        </xsl:when>
        <xsl:otherwise>
          <!-- <div class="navlink" id="prev"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttPrev']/@label"/></div> -->
          <li><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttPrev']/@label"/></li>
        </xsl:otherwise>
      </xsl:choose>   
      <xsl:choose>
        <xsl:when test="uplink/@url!=''">
          <!-- <div class="navlink" id="up"><a href="{uplink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttUp']/@label"/></a></div> -->
          <li><a href="{uplink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttUp']/@label"/></a></li>
        </xsl:when>
        <xsl:otherwise>
          <!-- <div class="navlink" id="up"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttUp']/@label"/></div> -->
          <li><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttUp']/@label"/></li>
        </xsl:otherwise>
      </xsl:choose>   
      <xsl:choose>
        <xsl:when test="nextlink/@url!=''">
          <!-- <div class="navlink" id="next"><a href="{nextlink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttNext']/@label"/></a></div> -->
          <li><a href="{nextlink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttNext']/@label"/></a></li>
        </xsl:when>
        <xsl:otherwise>
          <!-- <div class="navlink" id="next"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttNext']/@label"/></div> -->
          <li><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttNext']/@label"/></li>
        </xsl:otherwise>
      </xsl:choose>   
      <xsl:choose>
        <xsl:when test="lastlink/@url!=''">
          <!-- <div class="navlink" id="last"><a href="{lastlink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttLast']/@label"/></a></div> -->
          <li><a href="{lastlink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttLast']/@label"/></a></li>
        </xsl:when>
        <xsl:otherwise>
          <!-- <div class="navlink" id="last"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttLast']/@label"/></div> -->
          <li><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttLast']/@label"/></li>
        </xsl:otherwise>
      </xsl:choose>   
    </ul>
    <!-- </div>
  </div>
  </div> -->
  </nav>
</xsl:template>

</xsl:stylesheet>
