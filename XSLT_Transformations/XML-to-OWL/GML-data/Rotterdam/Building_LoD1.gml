<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!-- 
***********************************************************************
***********************************************************************

GeoBIM Benchmark 2019 - CityGML LoD1 and LoD2 Dataset

***********************************************************************

This file contains 252 textured buildings modelled in LoD1 and LoD2.
Some buildings are modelled using building parts.

This dataset was kindly provided by the Municipality of Rotterdam at
the beginning of 2019.

This dataset was additionally checked, validated and prepared for the
GeoBIM Benchmark 2019 by Francesca Noardo, Ken Arroyo Ohori
and Giorgio Agugiaro, TU Delft, in June 2019.

It can be retrieved from:

https://3d.bk.tudelft.nl/projects/geobim-benchmark/rotterdamlod12.html

If you use it, please participate in the benchmark by providing test
results and filling out the feedback form

https://3d.bk.tudelft.nl/projects/geobim-benchmark/task3.html

or

https://3d.bk.tudelft.nl/projects/geobim-benchmark/task4.html

THANK YOU!

***********************************************************************
***********************************************************************
-->
<CityModel xmlns:xAL="urn:oasis:names:tc:ciq:xsdschema:xAL:2.0" xmlns:gml="http://www.opengis.net/gml" xmlns:wtr="http://www.opengis.net/citygml/waterbody/2.0" xmlns:app="http://www.opengis.net/citygml/appearance/2.0" xmlns="http://www.opengis.net/citygml/2.0" xmlns:veg="http://www.opengis.net/citygml/vegetation/2.0" xmlns:dem="http://www.opengis.net/citygml/relief/2.0" xmlns:tran="http://www.opengis.net/citygml/transportation/2.0" xmlns:bldg="http://www.opengis.net/citygml/building/2.0" xmlns:grp="http://www.opengis.net/citygml/cityobjectgroup/2.0" xmlns:tun="http://www.opengis.net/citygml/tunnel/2.0" xmlns:frn="http://www.opengis.net/citygml/cityfurniture/2.0" xmlns:gen="http://www.opengis.net/citygml/generics/2.0" xmlns:brid="http://www.opengis.net/citygml/bridge/2.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:luse="http://www.opengis.net/citygml/landuse/2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/citygml/building/2.0 http://schemas.opengis.net/citygml/building/2.0/building.xsd http://www.opengis.net/citygml/cityobjectgroup/2.0 http://schemas.opengis.net/citygml/cityobjectgroup/2.0/cityObjectGroup.xsd http://www.opengis.net/citygml/tunnel/2.0 http://schemas.opengis.net/citygml/tunnel/2.0/tunnel.xsd http://www.opengis.net/citygml/waterbody/2.0 http://schemas.opengis.net/citygml/waterbody/2.0/waterBody.xsd http://www.opengis.net/citygml/appearance/2.0 http://schemas.opengis.net/citygml/appearance/2.0/appearance.xsd http://www.opengis.net/citygml/cityfurniture/2.0 http://schemas.opengis.net/citygml/cityfurniture/2.0/cityFurniture.xsd http://www.opengis.net/citygml/generics/2.0 http://schemas.opengis.net/citygml/generics/2.0/generics.xsd http://www.opengis.net/citygml/bridge/2.0 http://schemas.opengis.net/citygml/bridge/2.0/bridge.xsd http://www.opengis.net/citygml/vegetation/2.0 http://schemas.opengis.net/citygml/vegetation/2.0/vegetation.xsd http://www.opengis.net/citygml/relief/2.0 http://schemas.opengis.net/citygml/relief/2.0/relief.xsd http://www.opengis.net/citygml/transportation/2.0 http://schemas.opengis.net/citygml/transportation/2.0/transportation.xsd http://www.opengis.net/citygml/landuse/2.0 http://schemas.opengis.net/citygml/landuse/2.0/landUse.xsd">
  <cityObjectMember>
    <bldg:Building gml:id="ID_0599100000643092">
      <gml:boundedBy>
        <gml:Envelope srsName="urn:ogc:def:crs:EPSG::28992" srsDimension="3">
          <gml:lowerCorner>93460.98 437063.18 3.01130000000232</gml:lowerCorner>
          <gml:upperCorner>93471.11 437072.8 9.69260888055718</gml:upperCorner>
        </gml:Envelope>
      </gml:boundedBy>
      <creationDate>2019-06-11</creationDate>
      <gen:stringAttribute name="statusOmschr">
        <gen:value>Pand in gebruik</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="gebouwnummer">
        <gen:value>0599100000643092</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="typeOmschr">
        <gen:value>tussenpand</gen:value>
      </gen:stringAttribute>
      <gen:intAttribute name="aantalBouwlagen">
        <gen:value>1</gen:value>
      </gen:intAttribute>
      <gen:intAttribute name="hoogste_bouwlaag">
        <gen:value>0</gen:value>
      </gen:intAttribute>
      <gen:intAttribute name="laagste_bouwlaag">
        <gen:value>0</gen:value>
      </gen:intAttribute>
      <app:appearance>
        <app:Appearance gml:id="UUID_485db37d-954c-460e-a8fb-00147d077e2e">
          <app:theme>RhinoCity texturing</app:theme>
          <app:surfaceDataMember>
            <app:ParameterizedTexture gml:id="UUID_050523b5-f566-4049-b76f-5677b06e02d5">
              <app:imageURI>appearance/tex_6.jpg</app:imageURI>
              <app:textureType>specific</app:textureType>
              <app:wrapMode>border</app:wrapMode>
              <app:borderColor>0.0 0.0 0.0 1.0</app:borderColor>
              <app:target uri="#RCID_3abb8c3e-8e93-4137-869b-48931d0a86ec">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_3abb8c3e-8e93-4137-869b-48931d0a86ec_0_">0.330401 0.001957 0.477085 0.122839 0.114228 0.234824 0.003922 0.14363 0.256226 0.063824 0.222954 0.036983 0.330401 0.001957</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_dc26aef8-d838-4318-ab2a-9b5e3632db23">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_dc26aef8-d838-4318-ab2a-9b5e3632db23_0_">0.575709 0.001957 0.882874 0.140116 0.792288 0.2209 0.486275 0.081382 0.575709 0.001957</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_04055113-d60d-4559-b0da-8d12b0752ae3">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_04055113-d60d-4559-b0da-8d12b0752ae3_0_">0.473805 0.485558 0.435294 0.490948 0.461787 0.440313 0.492331 0.450062 0.473805 0.485558</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_a6f349f5-ccc3-43f0-a61f-5d7f59ccf71b">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_a6f349f5-ccc3-43f0-a61f-5d7f59ccf71b_0_">0.289873 0.491427 0.038921 0.57072 0.003922 0.518902 0.254757 0.440313 0.289873 0.491427</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_5dde7b78-f6d1-45eb-a942-19cc5ac84691">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_5dde7b78-f6d1-45eb-a942-19cc5ac84691_0_">0.529175 0.354968 0.39341 0.373034 0.32549 0.299472 0.358291 0.238748 0.557106 0.302464 0.529175 0.354968</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9a9eba7e-08c2-47f8-8cd7-51f1e2eff694">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9a9eba7e-08c2-47f8-8cd7-51f1e2eff694_0_">0.003922 0.238748 0.309599 0.377481 0.315319 0.436035 0.008972 0.298009 0.003922 0.238748</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_074ab516-8458-476a-bd36-35ef3411fb77">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_074ab516-8458-476a-bd36-35ef3411fb77_0_">0.58049 0.345352 0.568627 0.309734 0.791385 0.238748 0.81243 0.300324 0.740685 0.371207 0.58049 0.345352</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_e616826d-018c-4241-b7fe-146f35fca012">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_e616826d-018c-4241-b7fe-146f35fca012_0_">0.427384 0.474993 0.322235 0.509359 0.298039 0.473982 0.403493 0.440313 0.427384 0.474993</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
            </app:ParameterizedTexture>
          </app:surfaceDataMember>
        </app:Appearance>
      </app:appearance>
      <bldg:yearOfConstruction>1983</bldg:yearOfConstruction>
      <bldg:lod1Solid>
        <gml:Solid gml:id="ID_da8d90fb-3fcb-4fe6-bb27-a27d793d7016">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_f7d59304-f5fa-4d27-a014-1e931b7bbac1">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e5e7ba8f-0f33-4bb9-9729-e8f76b80e588">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e5e7ba8f-0f33-4bb9-9729-e8f76b80e588_0_">
                      <gml:posList srsDimension="3">93471.11 437068.64 7.48798923242773 93469.36 437066.84 7.48798923242773 93469.36 437066.84 3.01130000000232 93471.11 437068.64 3.01130000000232 93471.11 437068.64 7.48798923242773</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e56713a6-c50c-4ab6-aca2-1b50d714b100">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e56713a6-c50c-4ab6-aca2-1b50d714b100_0_">
                      <gml:posList srsDimension="3">93471.11 437068.64 3.01130000000232 93466.75 437072.8 3.01130000000232 93466.75 437072.8 7.48798923242773 93471.11 437068.64 7.48798923242773 93471.11 437068.64 3.01130000000232</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_bcc4eae2-c037-409c-891e-fb6e536531d7">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_bcc4eae2-c037-409c-891e-fb6e536531d7_0_">
                      <gml:posList srsDimension="3">93466.75 437072.8 3.01130000000232 93460.98 437066.75 3.01130000000232 93460.98 437066.75 7.48798923242773 93466.75 437072.8 7.48798923242773 93466.75 437072.8 3.01130000000232</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ba4fe5e2-d5a3-4f97-bfe4-1d1fcc625750">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ba4fe5e2-d5a3-4f97-bfe4-1d1fcc625750_0_">
                      <gml:posList srsDimension="3">93464.72 437063.18 7.48798923242773 93460.98 437066.75 7.48798923242773 93460.98 437066.75 3.01130000000232 93464.72 437063.18 3.01130000000232 93464.72 437063.18 7.48798923242773</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2b0f0f97-acdd-451b-bb49-cf7174769bd7">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2b0f0f97-acdd-451b-bb49-cf7174769bd7_0_">
                      <gml:posList srsDimension="3">93468.77 437067.42 7.48798923242773 93464.72 437063.18 7.48798923242773 93464.72 437063.18 3.01130000000232 93468.77 437067.42 3.01130000000232 93468.77 437067.42 7.48798923242773</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5bc12393-3806-4799-84c8-014b329b97a6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5bc12393-3806-4799-84c8-014b329b97a6_0_">
                      <gml:posList srsDimension="3">93469.36 437066.84 7.48798923242773 93468.77 437067.42 7.48798923242773 93468.77 437067.42 3.01130000000232 93469.36 437066.84 3.01130000000232 93469.36 437066.84 7.48798923242773</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e65cab58-4527-479e-8937-bd76f9e01db5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e65cab58-4527-479e-8937-bd76f9e01db5_0_">
                      <gml:posList srsDimension="3">93471.11 437068.64 7.48798923242773 93466.75 437072.8 7.48798923242773 93460.98 437066.75 7.48798923242773 93464.72 437063.18 7.48798923242773 93468.77 437067.42 7.48798923242773 93469.36 437066.84 7.48798923242773 93471.11 437068.64 7.48798923242773</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_dd1c9e54-4b93-4250-b600-332b2ef76d66">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_dd1c9e54-4b93-4250-b600-332b2ef76d66_0_">
                      <gml:posList srsDimension="3">93469.36 437066.84 3.01130000000232 93468.77 437067.42 3.01130000000232 93464.72 437063.18 3.01130000000232 93460.98 437066.75 3.01130000000232 93466.75 437072.8 3.01130000000232 93471.11 437068.64 3.01130000000232 93469.36 437066.84 3.01130000000232</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod1Solid>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:AddressDetails>
              <xAL:Country>
                <xAL:CountryName>Nederland</xAL:CountryName>
                <xAL:Locality Type="Town">
                  <xAL:LocalityName>Rotterdam</xAL:LocalityName>
                  <xAL:Thoroughfare Type="Street">
                    <xAL:ThoroughfareNumber>1</xAL:ThoroughfareNumber>
                    <xAL:ThoroughfareName>Koningsdam</xAL:ThoroughfareName>
                  </xAL:Thoroughfare>
                  <xAL:PostalCode>
                    <xAL:PostalCodeNumber>3011TN</xAL:PostalCodeNumber>
                  </xAL:PostalCode>
                </xAL:Locality>
              </xAL:Country>
            </xAL:AddressDetails>
          </xalAddress>
          <multiPoint>
            <gml:MultiPoint>
              <gml:pointMember>
                <gml:Point>
                  <gml:pos srsDimension="3">93468.8766666665 437069.62 3.28209999999712</gml:pos>
                </gml:Point>
              </gml:pointMember>
            </gml:MultiPoint>
          </multiPoint>
        </Address>
      </bldg:address>
    </bldg:Building>
  </cityObjectMember>
</CityModel>