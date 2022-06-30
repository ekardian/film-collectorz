<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" />

<xsl:param name="details">false</xsl:param>
<xsl:param name="absolutelinks">false</xsl:param>
<xsl:param name="thumbnails"><THUMBNAILS/></xsl:param>
<xsl:param name="indextablecols"><TABLECOLS/></xsl:param>
<xsl:param name="thumbshowcaption"><THUMBSHOWCAPTION/></xsl:param>

<!-- process a lookup item -->
<xsl:template match="node()[displayname!='']">
  <xsl:choose>
    <xsl:when test="url!=''">
      <a href="{url}"><xsl:value-of select="displayname"/></a>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="displayname"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- the main template -->
<xsl:template match="/">
  <HEAD>
	  
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!--Roboto font-->
    <!--<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700subset=latin,cyrillic-ext,greek-ext,greek,latin-ext,cyrillic' rel='stylesheet' type='text/css' />-->
    
    <link rel="icon" type="image/x-icon" href="images/biosfilm.ico" />
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    <LINK REL="StyleSheet" TYPE="text/css" HREF="<STYLESHEET/>" />
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta property="og:title" content="http://film.biosxtreme.net" />
		<meta property="og:url" content="http://film.biosxtreme.net/" />
		<meta property="og:type" content="website" />
		<meta property="og:description" content="Películas - Documentales - Videotutoriales - Películas Cristianas - Películas Cristianas infantiles - Películas motivacionales" />
		<meta property="og:image" content="http://film.biosxtreme.net/images/filmbiosxtreme.jpg" />
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!--<script src="js/angular.min.js"></script>-->
    <!--<script src="js/ng-infinite-scroll.min.js"></script>-->
    <!-- TOOLTIPS-->
    <script src="js/jq_tt/js/core.js"></script>
    <script src="js/jq_tt/js/csscoordinates.js"></script>
    <script src="js/jq_tt/js/displaycontroller.js"></script>
    <script src="js/jq_tt/js/placementcalculator.js"></script>
    <script src="js/jq_tt/js/tooltipcontroller.js"></script>
    <script src="js/jq_tt/js/utility.js"></script>
    <link rel="stylesheet" href="js/jq_tt/css/jquery.powertip.css" />
    <TITLE><REPORTHEADER/></TITLE>
  </HEAD>    
  <BODY>
    <div class="container-fluid">
<!-- NAV -->    
  <nav class="navbar navbar-default navbar-fixed-top">
<!-- MENU -->
  <div style="text-align: center;">
  <div class="btn-group dropdown">
              <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Menú <span class="glyphicon glyphicon-menu-hamburger"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
        <li>
                  <a href="http://info.biosxtreme.net/">Principal</a>
                </li>
        <li>
                  <a href="https://www.facebook.com/ClipsInfoContenido" target="blank">Facebook Pedidos</a>
                </li>
        <li role="separator" class="divider">
        </li>
                <li>
                  <a href="http://film.biosxtreme.net/">Pel&#237;culas Film</a>
                </li>
                <li>
                  <a href="http://juegos.biosxtreme.net/">Juegos</a>
                </li>
                <li>
                  <a href="http://musica.biosxtreme.net/">M&#250;sica</a>
                </li>
                <li>
                  <a href="http://libros.biosxtreme.net/">Libros</a>
                </li>
                <li>
                  <a href="http://comics.biosxtreme.net/">Comics</a>
                </li>
                <li>
                  <a href="http://apps.biosxtreme.net/">Programas-Apps</a>
                </li>
              </ul>
  </div>
<!-- BUSCADORES --> 
  <div class="btn-group dropdown">
              <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Buscar <span class="glyphicon glyphicon-search"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li>
                  <a href="http://tube.biosxtreme.net/bf">Pel&#237;culas-Videos</a>
                </li>
                <li>
                  <a href="http://tube.biosxtreme.net/bj">Juegos</a>
                </li>
                <li>
                  <a href="http://tube.biosxtreme.net/bm">M&#250;sica</a>
                </li>
                <li>
                  <a href="http://tube.biosxtreme.net/bl">Libros</a>
                </li>
                <li>
                  <a href="http://tube.biosxtreme.net/bc">Comics</a>
                </li>
                <li>
                  <a href="http://tube.biosxtreme.net/ba">Programas-Apps</a>
                </li>
              </ul>
  </div>
<!-- START Listas PDF-->
  <div class="btn-group dropdown">
              <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Listas PDF<span class="glyphicon glyphicon-download-alt"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li>
                  <a href="peliculas.pdf">Películas</a>
                </li>
                <li>
                  <a href="series.pdf">Series</a>
                </li>
                <li>
                  <a href="http://juegos.biosxtreme.net/juegos.pdf">Juegos</a>
                </li>
                <li>
                  <a href="http://musica.biosxtreme.net/musica.pdf">Música</a>
                </li>
                <li>
                  <a href="http://libros.biosxtreme.net/libros.pdf">Libros</a>
                </li>
                <li>
                  <a href="http://comics.biosxtreme.net/comics.pdf">Cómics</a>
                </li>
                <li>
                  <a href="http://apps.biosxtreme.net/aplicaciones.pdf">Apps</a>
                </li>
                <li>
                  <a href="https://ouo.io/pFpTS9">Adobe PDF Android</a>
                </li>
              </ul>
  </div>
  <!-- END Listas PDF-->
  </div>
  </nav>
  <div class="headreport">
      <span class="headr1">Colección Películas</span><span class="headr2"><REPORTHEADER/><sup><span id="ver">beta</span></sup></span>
    </div>
<!--end to web nav-->  
<!--end added-->
    <xsl:apply-templates select="movieinfo/navigation"/>    
    <br/>
          <ul class="list-inline text-center">
            <xsl:apply-templates select="movieinfo/movielist"/>
          </ul>
    <!--<xsl:if test="'<SHOWREPORTDATE/>'='Yes'">
      <br/>
      <div class="value"><xsl:value-of select="//@creationdate"/></div>
    </xsl:if>-->
    </div>
    <!--</div>-->
<script type="text/javascript">
  $(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({animation: true,html: true});
  });
</script>
<script type="text/javascript">
  $('ul li #tt_thumb').powerTip({
    placement: 'e',
    mouseOnToPopup: true,
    smartPlacement: true
  });
</script>
  </BODY>
</xsl:template>

<xsl:template match="movielist">
  <xsl:choose>
    <xsl:when test="$indextablecols = 1">
      <xsl:for-each select="movie">
        <!--<tr>-->
          <xsl:apply-templates select=". | following-sibling::movie[position() &lt; $indextablecols]"/>
        <!--</tr>-->
      </xsl:for-each>
    </xsl:when>
    <xsl:otherwise>
      <xsl:for-each select="movie[position() mod $indextablecols = 1]">
        <!--<tr>-->
          <xsl:apply-templates select=". | following-sibling::movie[position() &lt; $indextablecols]"/>
        <!--</tr>-->
      </xsl:for-each>
    </xsl:otherwise>            
  </xsl:choose>
</xsl:template>

<xsl:template match="movie">
  <xsl:choose>
    <xsl:when test="$details = 'true'">
      <xsl:variable name="the_href">details/<xsl:value-of select="id"/>.html</xsl:variable>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$absolutelinks = 'true'">
          <xsl:if test="coverfront!=''">
            <xsl:variable name="the_href">file:///<xsl:value-of select="coverfront"/></xsl:variable>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="coverfront!=''">
<!--to web coverfront-->            
            <!-- <xsl:variable name="the_href">https://googledrive.com/host/0B4IL_NIjd8oWfmNwdUZQX1pkV3ZWaDl5cmQxUW1CU2J3RW1EdXBZWm4xQ19acDNXWTQtTUk/<xsl:value-of select="id"/>f.jpg</xsl:variable> -->
            <xsl:variable name="the_href">images/<xsl:value-of select="id"/>f.jpg</xsl:variable>
<!--end to web coverfront-->            
<!--to local coverfront-->            
		<!-- <xsl:variable name="the_href">images/<xsl:value-of select="id"/>f.jpg</xsl:variable> -->
<!--end to local coverfront-->  
          </xsl:if>
        </xsl:otherwise>            
      </xsl:choose>
    </xsl:otherwise>            
  </xsl:choose>
  <xsl:choose>
    <xsl:when test="thumbfilepath!=''">
<!--to web thumbfilepath-->      
      <!-- <xsl:variable name="the_img_src">http://s1268.photobucket.com/user/clipscontenido/library/images/<xsl:value-of select="id"/>t.jpg</xsl:variable> -->
      <xsl:variable name="the_img_src">images/<xsl:value-of select="id"/>t.jpg</xsl:variable>
<!--ent to web thumbfilepath-->     
<!--to local thumbfilepath-->      
	<!-- <xsl:variable name="the_img_src">images/<xsl:value-of select="id"/>t.jpg</xsl:variable> -->
<!--end to local thumbfilepath-->  
    </xsl:when>
    <xsl:otherwise>
<!--to web mainitem-->      
      <!-- <xsl:variable name="the_img_src">https://googledrive.com/host/0B4IL_NIjd8oWfmNwdUZQX1pkV3ZWaDl5cmQxUW1CU2J3RW1EdXBZWm4xQ19acDNXWTQtTUk/mainitem.jpg</xsl:variable> -->
      <xsl:variable name="the_img_src">images/mainitem.jpg</xsl:variable>
<!--end to web mainitem-->
<!--to local mainitem-->      
	<!-- <xsl:variable name="the_img_src">images/mainitem.jpg</xsl:variable> -->
<!--end to local mainitem-->
    </xsl:otherwise>            
  </xsl:choose>
  <xsl:variable name="the_caption"><xsl:value-of select="title"/></xsl:variable>
<!--nuevas variables-->
  <xsl:variable name="fechamovie"><xsl:value-of select="releasedate/date"/></xsl:variable>
  <!--<xsl:variable name="the_genre"><xsl:value-of select="genres/genre/displayname"/></xsl:variable>-->
  <xsl:variable name="idioma"><xsl:value-of select="audios/audio/displayname"/></xsl:variable>
  <xsl:variable name="the_genre">
    <xsl:if test="genres!=''">
           <xsl:for-each select="genres/genre">
           <xsl:value-of select="displayname"/>
           <xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
           </xsl:for-each>
    </xsl:if>
  </xsl:variable>
  <xsl:variable name="the_title_org"><xsl:value-of select="originaltitle"/></xsl:variable>
<!--Thumbnail y tooltip-->
        <li class="col-xs-6 col-sm-3 col-md-2">
      <a href="{$the_href}" id="tt_thumb" title="&lt;h4&gt;{$the_caption}&lt;/h4&gt;
        &lt;i&gt;{$the_title_org}&lt;/i&gt;&lt;/br&gt;
        &lt;p id='fechamov'&gt;({$fechamovie})&lt;/p&gt;
        &lt;p&gt;&lt;span id='veridioma'&gt;Audio:&#160;&lt;/span&gt;{$idioma}&lt;/p&gt;
        {$the_genre}
        &lt;p&gt;&lt;a href='{$the_href}' id='verdetalles'&gt;Ver detalles&lt;/a&gt;&lt;/p&gt;">
        <img src="{$the_img_src}" id="nimg" class="img-rounded"/>
      </a>
        </li>
   <!--<xsl:if test="(last() &gt; $indextablecols) and (last()=position()) and (position() mod $indextablecols &gt; 0)">
      <xsl:variable name="filledCells" select="position() mod $indextablecols"/>
      <td colspan="{$indextablecols - $filledCells}">&#160;</td>
   </xsl:if>-->
</xsl:template>

<!-- PAGINACION -->
<xsl:template match="navigation">
    <xsl:if test="count(pagelink) > 1">
      <ul>
      <li style="display: inline"><ul class="pagination pagination-sm"><dt>Orden Alfabético</dt>
        <xsl:for-each select="pagelink">
          <xsl:choose>
            <xsl:when test="@url!=''">      
              <li><a href="{@url}"><span class="#"><xsl:value-of select="@pagenum"/></span></a></li>
            </xsl:when>
            <xsl:otherwise>
              <li class="active"><span class="#" aria-hidden="true"><xsl:value-of select="@pagenum"/></span></li>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="position()!=last()"></xsl:if>
        </xsl:for-each>
      </ul></li></ul>
        <ul class="pager">
        <xsl:choose>
          <xsl:when test="firstlink/@url!=''">
            <li class="btn-xs"><a href="{firstlink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttFirst']/@label"/></a></li>
          </xsl:when>
          <xsl:otherwise>
            (<xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttFirst']/@label"/>)
          </xsl:otherwise>
        </xsl:choose>   
        <xsl:choose>
          <xsl:when test="prevlink/@url!=''">
            <li class="btn-xs"><a href="{prevlink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttPrev']/@label"/></a></li>
          </xsl:when>
          <xsl:otherwise>
            (<xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttPrev']/@label"/>)
          </xsl:otherwise>
        </xsl:choose>   
        <xsl:choose>
          <xsl:when test="nextlink/@url!=''">
            <li class="btn-xs"><a href="{nextlink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttNext']/@label"/></a></li>
          </xsl:when>
          <xsl:otherwise>
            (<xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttNext']/@label"/>)
          </xsl:otherwise>
        </xsl:choose>   
        <xsl:choose>
          <xsl:when test="lastlink/@url!=''">
            <li class="btn-xs"><a href="{lastlink/@url}"><xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttLast']/@label"/></a></li>
          </xsl:when>
          <xsl:otherwise>
            (<xsl:value-of select="/movieinfo/localizedtemplatetexts/field[@id='ttLast']/@label"/>)
          </xsl:otherwise>
        </xsl:choose>
      </ul>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>

