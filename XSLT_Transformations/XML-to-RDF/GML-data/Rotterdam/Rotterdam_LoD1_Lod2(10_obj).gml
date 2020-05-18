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
      <bldg:lod2Solid>
        <gml:Solid gml:id="UUID_52083921-8b85-42d4-800e-0ba5c76cd477">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_9550be27-8d4c-4107-af91-9c23536bb648">
              <gml:surfaceMember xlink:href="#RCID_c2d16493-8700-46d1-8f5f-1b4fd418f549"/>
              <gml:surfaceMember xlink:href="#RCID_3abb8c3e-8e93-4137-869b-48931d0a86ec"/>
              <gml:surfaceMember xlink:href="#RCID_dc26aef8-d838-4318-ab2a-9b5e3632db23"/>
              <gml:surfaceMember xlink:href="#RCID_04055113-d60d-4559-b0da-8d12b0752ae3"/>
              <gml:surfaceMember xlink:href="#RCID_a6f349f5-ccc3-43f0-a61f-5d7f59ccf71b"/>
              <gml:surfaceMember xlink:href="#RCID_5dde7b78-f6d1-45eb-a942-19cc5ac84691"/>
              <gml:surfaceMember xlink:href="#RCID_9a9eba7e-08c2-47f8-8cd7-51f1e2eff694"/>
              <gml:surfaceMember xlink:href="#RCID_074ab516-8458-476a-bd36-35ef3411fb77"/>
              <gml:surfaceMember xlink:href="#RCID_e616826d-018c-4241-b7fe-146f35fca012"/>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod2Solid>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_0c6dcc59-049d-405a-ba11-b0e7ffe4c119">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_4a4da8ad-c539-41fb-902c-e8c840b3fa8a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_074ab516-8458-476a-bd36-35ef3411fb77">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_074ab516-8458-476a-bd36-35ef3411fb77_0_">
                      <gml:posList srsDimension="3">93471.11 437068.64 5.28336958429837 93471.11 437068.64 3.01130000000237 93466.75 437072.8 3.01130000000237 93466.75 437072.8 6.9365011043187 93468.4352958381 437071.19201131 9.69260888055718 93471.11 437068.64 5.28336958429837</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_4eab9b33-4475-4952-ab09-5ef0dbf35e84">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_29b8576e-2828-43f4-bcb8-4e8bbdfa6a15">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e616826d-018c-4241-b7fe-146f35fca012">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e616826d-018c-4241-b7fe-146f35fca012_0_">
                      <gml:posList srsDimension="3">93471.11 437068.64 5.28336958429837 93469.36 437066.84 5.32838329246958 93469.36 437066.84 3.01130000000237 93471.11 437068.64 3.01130000000237 93471.11 437068.64 5.28336958429837</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_c6a10c4b-069c-4d5b-809e-243b3da1a845">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e58d8cd9-9863-4ae7-8c76-e00b8085add7">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5dde7b78-f6d1-45eb-a942-19cc5ac84691">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5dde7b78-f6d1-45eb-a942-19cc5ac84691_0_">
                      <gml:posList srsDimension="3">93464.72 437063.18 6.35833666359661 93462.6980477318 437065.110045347 9.69220714618534 93460.98 437066.75 6.88195573217553 93460.98 437066.75 3.01130000000237 93464.72 437063.18 3.01130000000237 93464.72 437063.18 6.35833666359661</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_fa814654-9075-467f-bacc-42fd5008d49d">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c3c7da65-22ec-4653-b57d-53980dc6f0b4">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9a9eba7e-08c2-47f8-8cd7-51f1e2eff694">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9a9eba7e-08c2-47f8-8cd7-51f1e2eff694_0_">
                      <gml:posList srsDimension="3">93466.75 437072.8 3.01130000000237 93460.98 437066.75 3.01130000000237 93460.98 437066.75 6.88195573217553 93466.75 437072.8 6.9365011043187 93466.75 437072.8 3.01130000000237</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_b0ccb195-543a-420d-b24f-1acaa29efe0f">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_9ac39414-d9d9-414a-8e11-0ac7f279db78">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a6f349f5-ccc3-43f0-a61f-5d7f59ccf71b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a6f349f5-ccc3-43f0-a61f-5d7f59ccf71b_0_">
                      <gml:posList srsDimension="3">93468.77 437067.42 6.31496247021562 93464.72 437063.18 6.35833666359661 93464.72 437063.18 3.01130000000237 93468.77 437067.42 3.01130000000237 93468.77 437067.42 6.31496247021562</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_af1cf0d0-bbc0-4d7d-9e38-ede1db48764c">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_65d128d1-4052-4624-a911-405250546077">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_04055113-d60d-4559-b0da-8d12b0752ae3">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_04055113-d60d-4559-b0da-8d12b0752ae3_0_">
                      <gml:posList srsDimension="3">93469.36 437066.84 5.32838329246958 93468.77 437067.42 6.31496247021562 93468.77 437067.42 3.01130000000237 93469.36 437066.84 3.01130000000237 93469.36 437066.84 5.32838329246958</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_13116e22-fefd-4e1a-9470-6992f9a43277">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_41691bc0-bd22-40d7-ad58-5a453067237f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_dc26aef8-d838-4318-ab2a-9b5e3632db23">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_dc26aef8-d838-4318-ab2a-9b5e3632db23_0_">
                      <gml:posList srsDimension="3">93466.75 437072.8 6.9365011043187 93460.98 437066.75 6.88195573217553 93462.6980477318 437065.110045347 9.69220714618534 93468.4352958381 437071.19201131 9.69260888055718 93466.75 437072.8 6.9365011043187</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_656aad46-35c3-464b-b739-5d123b21426c">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_a91dd4e1-768e-4720-9543-5ecc387d3e99">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3abb8c3e-8e93-4137-869b-48931d0a86ec">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3abb8c3e-8e93-4137-869b-48931d0a86ec_0_">
                      <gml:posList srsDimension="3">93471.11 437068.64 5.28336958429837 93468.4352958381 437071.19201131 9.69260888055718 93462.6980477318 437065.110045347 9.69220714618534 93464.72 437063.18 6.35833666359661 93468.77 437067.42 6.31496247021562 93469.36 437066.84 5.32838329246958 93471.11 437068.64 5.28336958429837</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:GroundSurface gml:id="UUID_d7d650ac-6751-4285-aaac-ed6b4929d23c">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_b3fe67d6-9428-4b4f-a7f2-d89ddf1f407c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c2d16493-8700-46d1-8f5f-1b4fd418f549">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c2d16493-8700-46d1-8f5f-1b4fd418f549_0_">
                      <gml:posList srsDimension="3">93469.36 437066.84 3.01130000000237 93468.77 437067.42 3.01130000000237 93464.72 437063.18 3.01130000000237 93460.98 437066.75 3.01130000000237 93466.75 437072.8 3.01130000000237 93471.11 437068.64 3.01130000000237 93469.36 437066.84 3.01130000000237</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:GroundSurface>
      </bldg:boundedBy>
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
  <cityObjectMember>
    <bldg:Building gml:id="ID_0599100000764940">
      <gml:boundedBy>
        <gml:Envelope srsName="urn:ogc:def:crs:EPSG::28992" srsDimension="3">
          <gml:lowerCorner>93080.338 436872.396 2.3283E-14</gml:lowerCorner>
          <gml:upperCorner>93092.1660000011 436886.053 12.8184608011252</gml:upperCorner>
        </gml:Envelope>
      </gml:boundedBy>
      <creationDate>2019-06-11</creationDate>
      <gen:stringAttribute name="typeOmschr">
        <gen:value>half vrijstaand</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="statusOmschr">
        <gen:value>Pand in gebruik</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="gebouwnummer">
        <gen:value>0599100000764940</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="deviation">
        <gen:value>yes</gen:value>
      </gen:stringAttribute>
      <gen:intAttribute name="aantalBouwlagen">
        <gen:value>5</gen:value>
      </gen:intAttribute>
      <gen:intAttribute name="hoogste_bouwlaag">
        <gen:value>3</gen:value>
      </gen:intAttribute>
      <gen:intAttribute name="laagste_bouwlaag">
        <gen:value>1</gen:value>
      </gen:intAttribute>
      <app:appearance>
        <app:Appearance gml:id="UUID_e255f4a7-4088-48d4-bcd5-ddd0a47d01ca">
          <app:theme>RhinoCity texturing</app:theme>
          <app:surfaceDataMember>
            <app:ParameterizedTexture gml:id="UUID_0d59fb33-23db-4167-b81e-02f07a9c08f0">
              <app:imageURI>appearance/tex_4.jpg</app:imageURI>
              <app:textureType>specific</app:textureType>
              <app:wrapMode>border</app:wrapMode>
              <app:borderColor>0.0 0.0 0.0 1.0</app:borderColor>
              <app:target uri="#RCID_12c16fac-6f65-41ee-bd15-9abf68e26d88">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_12c16fac-6f65-41ee-bd15-9abf68e26d88_0_">0.010045 0.131692 0.011176 0.120158 0.018722 0.042565 0.020319 0.026184 0.127751 0.050868 0.131258 0.001957 0.245074 0.028146 0.226794 0.186196 0.220362 0.241892 0.219434 0.24944 0.001957 0.195905 0.003355 0.188748 0.009195 0.139012 0.010045 0.131692</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_552000ed-72ba-4536-8979-f0b248fca1f4">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_552000ed-72ba-4536-8979-f0b248fca1f4_0_">0.002738 0.507533 0.006648 0.46771 0.111843 0.491692 0.108368 0.539689 0.001957 0.515467 0.002738 0.507533</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_225e8b7b-baf0-4573-bdf7-f095f6e8b270">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_225e8b7b-baf0-4573-bdf7-f095f6e8b270_0_">0.291585 0.46771 0.291585 0.46771 0.291585 0.46771 0.291585 0.46771 0.291585 0.46771 0.291585 0.46771 0.291585 0.46771 0.291585 0.46771</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_bdade845-2843-479b-9d60-41ec670c204c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_bdade845-2843-479b-9d60-41ec670c204c_0_">0.118747 0.46771 0.225125 0.490929 0.223809 0.493999 0.117417 0.47078 0.118747 0.46771</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_6f794572-c468-4cbe-8b54-6b1b35de064b">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_6f794572-c468-4cbe-8b54-6b1b35de064b_0_">0.23092 0.46771 0.286528 0.48019 0.287029 0.483125 0.231414 0.470645 0.23092 0.46771</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_145e671f-54f1-45b4-8c84-2041fb285463">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_145e671f-54f1-45b4-8c84-2041fb285463_0_">0.562272 0.222187 0.493151 0.204353 0.512368 0.044658 0.517507 0.001957 0.586113 0.019774 0.562272 0.222187</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_4385c008-2b8b-47d8-8864-28e603ba62d6">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_4385c008-2b8b-47d8-8864-28e603ba62d6_0_">0.880567 0.211941 0.682975 0.161549 0.703582 0.001957 0.90001 0.052311 0.880567 0.211941</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_7873254b-767d-4249-b07e-5ccc5110393b">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_7873254b-767d-4249-b07e-5ccc5110393b_0_">0.382824 0.459141 0.373777 0.456681 0.396763 0.254403 0.405743 0.256861 0.382824 0.459141</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_028a24f1-9686-454b-957a-ef43fa380af4">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_028a24f1-9686-454b-957a-ef43fa380af4_0_">0.421747 0.235056 0.250489 0.202844 0.317959 0.001957 0.488119 0.034233 0.421747 0.235056</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_bff57fd3-9618-4223-b63a-148936bb0976">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_bff57fd3-9618-4223-b63a-148936bb0976_0_">0.332681 0.254403 0.340668 0.257137 0.369689 0.458801 0.361646 0.456065 0.332681 0.254403</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_a0a82d89-a98c-4b88-a6bc-671973cd80ac">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_a0a82d89-a98c-4b88-a6bc-671973cd80ac_0_">0.319119 0.456084 0.289628 0.254403 0.297829 0.256766 0.304063 0.299315 0.327378 0.458449 0.319119 0.456084</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_57c1354d-89d9-46dc-a75a-9fd8141e8012">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_57c1354d-89d9-46dc-a75a-9fd8141e8012_0_">0.628869 0.413185 0.604697 0.254403 0.632301 0.261887 0.656128 0.417414 0.646963 0.414941 0.647461 0.418202 0.628869 0.413185</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2e8d709e-e089-4514-98c8-e369ab443b36">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2e8d709e-e089-4514-98c8-e369ab443b36_0_">0.530333 0.254403 0.576415 0.266782 0.600708 0.422361 0.554374 0.409972 0.530333 0.254403</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_b8803f90-e4ff-48ab-a5b9-c8c9bf98234a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_b8803f90-e4ff-48ab-a5b9-c8c9bf98234a_0_">0.661448 0.254403 0.674366 0.257963 0.697695 0.416703 0.684705 0.413141 0.661448 0.254403</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_b157d0de-5c21-4293-ba59-20b3b0c38ad6">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_b157d0de-5c21-4293-ba59-20b3b0c38ad6_0_">0.410959 0.254403 0.500601 0.278254 0.525251 0.437235 0.435107 0.413365 0.410959 0.254403</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_5b097aa7-9f5c-4476-86c4-3a0e5cefdb7a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_5b097aa7-9f5c-4476-86c4-3a0e5cefdb7a_0_">0.590998 0.001957 0.648362 0.0181 0.678654 0.2199 0.620882 0.20374 0.590998 0.001957</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d7a54b88-47d2-4fe3-994d-0744fc3cbd0e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d7a54b88-47d2-4fe3-994d-0744fc3cbd0e_0_">0.719974 0.254403 0.934865 0.308154 0.917809 0.350144 0.702544 0.296375 0.719974 0.254403</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_b0342911-c173-464f-8e5c-8eafa792d08f">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_b0342911-c173-464f-8e5c-8eafa792d08f_0_">0.001957 0.409694 0.066124 0.254403 0.28497 0.304891 0.220874 0.463505 0.106933 0.437354 0.108265 0.434096 0.001957 0.409694</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
            </app:ParameterizedTexture>
          </app:surfaceDataMember>
        </app:Appearance>
      </app:appearance>
      <bldg:yearOfConstruction>1956</bldg:yearOfConstruction>
      <bldg:lod1Solid>
        <gml:Solid gml:id="ID_426edced-8d3b-4f7e-b772-c762305d2ed0">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_2d6ba57f-2d9a-4171-a975-6eb7e39d4158">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_88be4261-105e-40cc-9478-1f7a86b7ad01">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_88be4261-105e-40cc-9478-1f7a86b7ad01_0_">
                      <gml:posList srsDimension="3">93089.466 436882.816 2.72000000000002 93089.049 436884.035 2.72000000000002 93089.049 436884.035 12.8184608011252 93089.466 436882.816 12.8184608011252 93089.466 436882.816 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8a328cc3-c906-4c36-aa00-030edb390556">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8a328cc3-c906-4c36-aa00-030edb390556_0_">
                      <gml:posList srsDimension="3">93089.049 436884.035 2.72000000000002 93088.359 436886.053 2.72000000000002 93088.359 436886.053 12.8184608011252 93089.049 436884.035 12.8184608011252 93089.049 436884.035 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_00f19e9b-e164-4dcd-a064-c4b9d4e4dbf6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_00f19e9b-e164-4dcd-a064-c4b9d4e4dbf6_0_">
                      <gml:posList srsDimension="3">93088.359 436886.053 2.72000000000002 93080.338 436883.494 2.72000000000002 93080.338 436883.494 12.8184608011252 93088.359 436886.053 12.8184608011252 93088.359 436886.053 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5d2afb7b-d493-4d0b-ae51-9d9db2ad46ec">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5d2afb7b-d493-4d0b-ae51-9d9db2ad46ec_0_">
                      <gml:posList srsDimension="3">93083.116 436875.583 12.8184608011252 93080.338 436883.494 12.8184608011252 93080.338 436883.494 2.72000000000002 93083.116 436875.583 2.72000000000002 93083.116 436875.583 12.8184608011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_afc8a8e8-1a00-4738-9cc8-1f4da2a91201">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_afc8a8e8-1a00-4738-9cc8-1f4da2a91201_0_">
                      <gml:posList srsDimension="3">93084.101 436872.777 12.8184608011252 93083.116 436875.583 12.8184608011252 93083.116 436875.583 2.72000000000002 93084.101 436872.777 2.72000000000002 93084.101 436872.777 12.8184608011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_551032d8-df55-4135-bb38-be646caa1004">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_551032d8-df55-4135-bb38-be646caa1004_0_">
                      <gml:posList srsDimension="3">93084.237 436872.396 12.8184608011252 93084.101 436872.777 12.8184608011252 93084.101 436872.777 2.72000000000002 93084.237 436872.396 2.72000000000002 93084.237 436872.396 12.8184608011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f08c5c62-0e26-4980-a9df-c924c1ff6633">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f08c5c62-0e26-4980-a9df-c924c1ff6633_0_">
                      <gml:posList srsDimension="3">93092.166 436875.135 12.8184608011252 93084.237 436872.396 12.8184608011252 93084.237 436872.396 2.72000000000002 93092.166 436875.135 2.72000000000002 93092.166 436875.135 12.8184608011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4f2ccb65-8f94-4d41-a5a5-d7db3eebe745">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4f2ccb65-8f94-4d41-a5a5-d7db3eebe745_0_">
                      <gml:posList srsDimension="3">93092.166 436875.135 2.72000000000002 93092.015 436875.495 2.72000000000002 93092.015 436875.495 12.8184608011252 93092.166 436875.135 12.8184608011252 93092.166 436875.135 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_db7efc48-ed0e-4bc2-bc17-8177c0db800b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_db7efc48-ed0e-4bc2-bc17-8177c0db800b_0_">
                      <gml:posList srsDimension="3">93092.015 436875.495 2.72000000000002 93091.121 436877.993 2.72000000000002 93091.121 436877.993 12.8184608011252 93092.015 436875.495 12.8184608011252 93092.015 436875.495 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6d177bfa-3dbd-4cad-af17-134144195daf">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6d177bfa-3dbd-4cad-af17-134144195daf_0_">
                      <gml:posList srsDimension="3">93091.121 436877.993 2.72000000000002 93090.99 436878.36 2.72000000000002 93090.99 436878.36 12.8184608011252 93091.121 436877.993 12.8184608011252 93091.121 436877.993 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a55853fd-88cd-43b0-9f06-29d0d0210acc">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a55853fd-88cd-43b0-9f06-29d0d0210acc_0_">
                      <gml:posList srsDimension="3">93090.99 436878.36 2.72000000000002 93090.792 436878.938 2.72000000000002 93090.792 436878.938 12.8184608011252 93090.99 436878.36 12.8184608011252 93090.99 436878.36 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_be680849-fa8c-4e49-baa9-21ce2585e85f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_be680849-fa8c-4e49-baa9-21ce2585e85f_0_">
                      <gml:posList srsDimension="3">93090.792 436878.938 2.72000000000002 93089.466 436882.816 2.72000000000002 93089.466 436882.816 12.8184608011252 93090.792 436878.938 12.8184608011252 93090.792 436878.938 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_19a7075a-56be-49dd-af24-95b17d1e2182">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_19a7075a-56be-49dd-af24-95b17d1e2182_0_">
                      <gml:posList srsDimension="3">93090.99 436878.36 12.8184608011252 93090.792 436878.938 12.8184608011252 93089.466 436882.816 12.8184608011252 93089.049 436884.035 12.8184608011252 93088.359 436886.053 12.8184608011252 93080.338 436883.494 12.8184608011252 93083.116 436875.583 12.8184608011252 93084.101 436872.777 12.8184608011252 93084.237 436872.396 12.8184608011252 93092.166 436875.135 12.8184608011252 93092.015 436875.495 12.8184608011252 93091.121 436877.993 12.8184608011252 93090.99 436878.36 12.8184608011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e3dd4b91-88e6-4123-8ffa-eaa15aa159c5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e3dd4b91-88e6-4123-8ffa-eaa15aa159c5_0_">
                      <gml:posList srsDimension="3">93091.121 436877.993 2.72000000000002 93092.015 436875.495 2.72000000000002 93092.166 436875.135 2.72000000000002 93084.237 436872.396 2.72000000000002 93084.101 436872.777 2.72000000000002 93083.116 436875.583 2.72000000000002 93080.338 436883.494 2.72000000000002 93088.359 436886.053 2.72000000000002 93089.049 436884.035 2.72000000000002 93089.466 436882.816 2.72000000000002 93090.792 436878.938 2.72000000000002 93090.99 436878.36 2.72000000000002 93091.121 436877.993 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod1Solid>
      <bldg:lod2Solid>
        <gml:Solid gml:id="UUID_c1c48d6d-66cd-4587-a133-26fcf6750fe0">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_1c43c807-0ad9-4869-98fb-dc0cd5aca58a">
              <gml:surfaceMember xlink:href="#RCID_73cb69ca-663c-4be0-b831-94d769126edc"/>
              <gml:surfaceMember xlink:href="#RCID_12c16fac-6f65-41ee-bd15-9abf68e26d88"/>
              <gml:surfaceMember xlink:href="#RCID_552000ed-72ba-4536-8979-f0b248fca1f4"/>
              <gml:surfaceMember xlink:href="#RCID_225e8b7b-baf0-4573-bdf7-f095f6e8b270"/>
              <gml:surfaceMember xlink:href="#RCID_bdade845-2843-479b-9d60-41ec670c204c"/>
              <gml:surfaceMember xlink:href="#RCID_6f794572-c468-4cbe-8b54-6b1b35de064b"/>
              <gml:surfaceMember xlink:href="#RCID_145e671f-54f1-45b4-8c84-2041fb285463"/>
              <gml:surfaceMember xlink:href="#RCID_4385c008-2b8b-47d8-8864-28e603ba62d6"/>
              <gml:surfaceMember xlink:href="#RCID_7873254b-767d-4249-b07e-5ccc5110393b"/>
              <gml:surfaceMember xlink:href="#RCID_028a24f1-9686-454b-957a-ef43fa380af4"/>
              <gml:surfaceMember xlink:href="#RCID_bff57fd3-9618-4223-b63a-148936bb0976"/>
              <gml:surfaceMember xlink:href="#RCID_a0a82d89-a98c-4b88-a6bc-671973cd80ac"/>
              <gml:surfaceMember xlink:href="#RCID_57c1354d-89d9-46dc-a75a-9fd8141e8012"/>
              <gml:surfaceMember xlink:href="#RCID_2e8d709e-e089-4514-98c8-e369ab443b36"/>
              <gml:surfaceMember xlink:href="#RCID_b8803f90-e4ff-48ab-a5b9-c8c9bf98234a"/>
              <gml:surfaceMember xlink:href="#RCID_b157d0de-5c21-4293-ba59-20b3b0c38ad6"/>
              <gml:surfaceMember xlink:href="#RCID_5b097aa7-9f5c-4476-86c4-3a0e5cefdb7a"/>
              <gml:surfaceMember xlink:href="#RCID_d7a54b88-47d2-4fe3-994d-0744fc3cbd0e"/>
              <gml:surfaceMember xlink:href="#RCID_b0342911-c173-464f-8e5c-8eafa792d08f"/>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod2Solid>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_70d4720c-994d-41f3-8620-142ac5fec3e4">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c95147e4-a67d-49a1-ab68-6ced0b952a7d">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_028a24f1-9686-454b-957a-ef43fa380af4">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_028a24f1-9686-454b-957a-ef43fa380af4_0_">
                      <gml:posList srsDimension="3">93092.1660000011 436875.135000002 12.8184608011252 93084.2369999997 436872.396000002 12.8184608011252 93084.2369999997 436872.396000002 2.3283E-14 93092.1660000011 436875.135000002 2.3283E-14 93092.1660000011 436875.135000002 12.8184608011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_73e7b383-d3b3-43f0-996a-b3f363344150">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_fc4f9434-ccae-4c0d-a2b4-aaeda85531d1">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_bff57fd3-9618-4223-b63a-148936bb0976">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_bff57fd3-9618-4223-b63a-148936bb0976_0_">
                      <gml:posList srsDimension="3">93092.1660000011 436875.135000002 2.3283E-14 93092.0150000006 436875.495000001 2.3283E-14 93092.0150000006 436875.495000001 12.8184608011252 93092.1660000011 436875.135000002 12.8184608011252 93092.1660000011 436875.135000002 2.3283E-14</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_5375d02d-184c-42db-95b9-ab196f37ebb7">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_b38011d1-8b50-48e4-9518-674412100a72">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_552000ed-72ba-4536-8979-f0b248fca1f4">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_552000ed-72ba-4536-8979-f0b248fca1f4_0_">
                      <gml:posList srsDimension="3">93089.049 436884.035 12.6122108011252 93088.359 436886.053 12.6122108011252 93084.4902486936 436884.818723153 12.6122108011252 93085.2676332051 436882.382067753 12.6122108011252 93089.1867215208 436883.632403996 12.6122108011252 93089.049 436884.035 12.6122108011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_818caf55-32ba-4ac6-ab4f-8ce677f9bf26">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_6ba47c8d-2136-4cfe-8931-b31bcc0a918b">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_145e671f-54f1-45b4-8c84-2041fb285463">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_145e671f-54f1-45b4-8c84-2041fb285463_0_">
                      <gml:posList srsDimension="3">93084.1009999998 436872.776999999 12.8184608011252 93083.1160999983 436875.582899999 12.8184608011252 93083.1160999983 436875.582899999 2.72000000000002 93083.1160999983 436875.582899999 2.3283E-14 93084.1009999998 436872.776999999 2.3283E-14 93084.1009999998 436872.776999999 12.8184608011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4385c008-2b8b-47d8-8864-28e603ba62d6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4385c008-2b8b-47d8-8864-28e603ba62d6_0_">
                      <gml:posList srsDimension="3">93083.1160999983 436875.582899999 12.8184608011252 93080.338 436883.494 12.8184608011252 93080.338 436883.494 2.72000000000002 93083.1160999983 436875.582899999 2.72000000000002 93083.1160999983 436875.582899999 12.8184608011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7873254b-767d-4249-b07e-5ccc5110393b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7873254b-767d-4249-b07e-5ccc5110393b_0_">
                      <gml:posList srsDimension="3">93084.2369999997 436872.396000002 12.8184608011252 93084.1009999998 436872.776999999 12.8184608011252 93084.1009999998 436872.776999999 2.3283E-14 93084.2369999997 436872.396000002 2.3283E-14 93084.2369999997 436872.396000002 12.8184608011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_ebeb65b1-5d37-4e65-b4a1-72dd5a5e77f1">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c8227830-a357-4701-8481-cce95c11f787">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_12c16fac-6f65-41ee-bd15-9abf68e26d88">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_12c16fac-6f65-41ee-bd15-9abf68e26d88_0_">
                      <gml:posList srsDimension="3">93090.9899999983 436878.359999999 12.8184608011252 93090.792 436878.938 12.8184608011252 93089.466 436882.816 12.8184608011252 93089.1867215208 436883.632403996 12.8184608011252 93085.2676332051 436882.382067753 12.8184608011252 93084.4902486936 436884.818723153 12.8184608011252 93080.338 436883.494 12.8184608011252 93083.1160999983 436875.582899999 12.8184608011252 93084.1009999998 436872.776999999 12.8184608011252 93084.2369999997 436872.396000002 12.8184608011252 93092.1660000011 436875.135000002 12.8184608011252 93092.0150000006 436875.495000001 12.8184608011252 93091.1209999993 436877.993000001 12.8184608011252 93090.9899999983 436878.359999999 12.8184608011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_4dfcb0e0-e65d-4326-a8a2-4470b75c4f2d">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_70e6729e-e694-4106-96a8-4ab61684e311">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6f794572-c468-4cbe-8b54-6b1b35de064b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6f794572-c468-4cbe-8b54-6b1b35de064b_0_">
                      <gml:posList srsDimension="3">93085.2676332051 436882.382067753 12.6122108011252 93084.4902486936 436884.818723153 12.6122108011252 93084.4902486936 436884.818723153 12.8184608011252 93085.2676332051 436882.382067753 12.8184608011252 93085.2676332051 436882.382067753 12.6122108011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:GroundSurface gml:id="UUID_2ba31972-e998-454e-81e9-6fcc313678d8">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_27b9a628-1d37-423c-8b87-d21f59adfa78">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_73cb69ca-663c-4be0-b831-94d769126edc">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_73cb69ca-663c-4be0-b831-94d769126edc_0_">
                      <gml:posList srsDimension="3">93089.466 436882.816 2.72000000000002 93090.792 436878.938 2.72000000000002 93090.9899999983 436878.359999999 2.72000000000002 93083.1160999983 436875.582899999 2.72000000000002 93080.338 436883.494 2.72000000000002 93088.359 436886.053 2.72000000000002 93089.049 436884.035 2.72000000000002 93089.466 436882.816 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:GroundSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_a5c9e902-5e3b-4654-be7a-20a976b21628">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_095c53f2-616b-4c8f-b1bb-f2383ab576eb">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_bdade845-2843-479b-9d60-41ec670c204c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_bdade845-2843-479b-9d60-41ec670c204c_0_">
                      <gml:posList srsDimension="3">93089.1867215208 436883.632403996 12.6122108011252 93085.2676332051 436882.382067753 12.6122108011252 93085.2676332051 436882.382067753 12.8184608011252 93089.1867215208 436883.632403996 12.8184608011252 93089.1867215208 436883.632403996 12.6122108011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d1ebd112-1dac-4ce4-9687-2784540df563">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_32a97ac1-852a-4439-b7dd-18193fb44de3">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a0a82d89-a98c-4b88-a6bc-671973cd80ac">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a0a82d89-a98c-4b88-a6bc-671973cd80ac_0_">
                      <gml:posList srsDimension="3">93091.1209999993 436877.993000001 12.8184608011252 93091.1209999993 436877.993000001 2.3283E-14 93090.9899999983 436878.359999999 2.3283E-14 93090.9899999983 436878.359999999 2.72000000000002 93090.9899999983 436878.359999999 12.8184608011252 93091.1209999993 436877.993000001 12.8184608011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_57c1354d-89d9-46dc-a75a-9fd8141e8012">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_57c1354d-89d9-46dc-a75a-9fd8141e8012_0_">
                      <gml:posList srsDimension="3">93089.466 436882.816 12.8184608011252 93089.466 436882.816 2.72000000000002 93089.049 436884.035 2.72000000000002 93089.049 436884.035 12.6122108011252 93089.1867215208 436883.632403996 12.6122108011252 93089.1867215208 436883.632403996 12.8184608011252 93089.466 436882.816 12.8184608011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2e8d709e-e089-4514-98c8-e369ab443b36">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2e8d709e-e089-4514-98c8-e369ab443b36_0_">
                      <gml:posList srsDimension="3">93089.049 436884.035 2.72000000000002 93088.359 436886.053 2.72000000000002 93088.359 436886.053 12.6122108011252 93089.049 436884.035 12.6122108011252 93089.049 436884.035 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b8803f90-e4ff-48ab-a5b9-c8c9bf98234a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b8803f90-e4ff-48ab-a5b9-c8c9bf98234a_0_">
                      <gml:posList srsDimension="3">93090.9899999983 436878.359999999 2.72000000000002 93090.792 436878.938 2.72000000000002 93090.792 436878.938 12.8184608011252 93090.9899999983 436878.359999999 12.8184608011252 93090.9899999983 436878.359999999 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b157d0de-5c21-4293-ba59-20b3b0c38ad6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b157d0de-5c21-4293-ba59-20b3b0c38ad6_0_">
                      <gml:posList srsDimension="3">93090.792 436878.938 2.72000000000002 93089.466 436882.816 2.72000000000002 93089.466 436882.816 12.8184608011252 93090.792 436878.938 12.8184608011252 93090.792 436878.938 2.72000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5b097aa7-9f5c-4476-86c4-3a0e5cefdb7a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5b097aa7-9f5c-4476-86c4-3a0e5cefdb7a_0_">
                      <gml:posList srsDimension="3">93092.0150000006 436875.495000001 2.3283E-14 93091.1209999993 436877.993000001 2.3283E-14 93091.1209999993 436877.993000001 12.8184608011252 93092.0150000006 436875.495000001 12.8184608011252 93092.0150000006 436875.495000001 2.3283E-14</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_ba1db19d-bce2-4ae7-8137-4c624d88fa1e">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_86c3d3f1-da37-4968-9f73-b6cee9c88d3f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d7a54b88-47d2-4fe3-994d-0744fc3cbd0e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d7a54b88-47d2-4fe3-994d-0744fc3cbd0e_0_">
                      <gml:posList srsDimension="3">93090.9899999983 436878.359999999 2.3283E-14 93083.1160999983 436875.582899999 2.3283E-14 93083.1160999983 436875.582899999 2.72000000000002 93090.9899999983 436878.359999999 2.72000000000002 93090.9899999983 436878.359999999 2.3283E-14</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:OuterCeilingSurface gml:id="UUID_cb40deb6-f8af-4815-b50c-89e813e3e446">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_03e15a6d-afbb-4d85-bd2c-c2eb8e212a09">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_225e8b7b-baf0-4573-bdf7-f095f6e8b270">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_225e8b7b-baf0-4573-bdf7-f095f6e8b270_0_">
                      <gml:posList srsDimension="3">93092.0150000006 436875.495000001 2.3283E-14 93092.1660000011 436875.135000002 2.3283E-14 93084.2369999997 436872.396000002 2.3283E-14 93084.1009999998 436872.776999999 2.3283E-14 93083.1160999983 436875.582899999 2.3283E-14 93090.9899999983 436878.359999999 2.3283E-14 93091.1209999993 436877.993000001 2.3283E-14 93092.0150000006 436875.495000001 2.3283E-14</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:OuterCeilingSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_be0ab432-0963-4d0b-8e73-1e1b064b2562">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_79c08376-13ce-4311-b7fd-a19ab6706d98">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b0342911-c173-464f-8e5c-8eafa792d08f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b0342911-c173-464f-8e5c-8eafa792d08f_0_">
                      <gml:posList srsDimension="3">93088.359 436886.053 12.6122108011252 93088.359 436886.053 2.72000000000002 93080.338 436883.494 2.72000000000002 93080.338 436883.494 12.8184608011252 93084.4902486936 436884.818723153 12.8184608011252 93084.4902486936 436884.818723153 12.6122108011252 93088.359 436886.053 12.6122108011252</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:AddressDetails>
              <xAL:Country>
                <xAL:CountryName>Nederland</xAL:CountryName>
                <xAL:Locality Type="Town">
                  <xAL:LocalityName>Rotterdam</xAL:LocalityName>
                  <xAL:Thoroughfare Type="Street">
                    <xAL:ThoroughfareNumber>3</xAL:ThoroughfareNumber>
                    <xAL:ThoroughfareName>Bierstraat</xAL:ThoroughfareName>
                  </xAL:Thoroughfare>
                  <xAL:PostalCode>
                    <xAL:PostalCodeNumber>3011XA</xAL:PostalCodeNumber>
                  </xAL:PostalCode>
                </xAL:Locality>
              </xAL:Country>
            </xAL:AddressDetails>
          </xalAddress>
          <multiPoint>
            <gml:MultiPoint>
              <gml:pointMember>
                <gml:Point>
                  <gml:pos srsDimension="3">93088.4089999999 436877.312 2.74946333333381</gml:pos>
                </gml:Point>
              </gml:pointMember>
            </gml:MultiPoint>
          </multiPoint>
        </Address>
      </bldg:address>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:AddressDetails>
              <xAL:Country>
                <xAL:CountryName>Nederland</xAL:CountryName>
                <xAL:Locality Type="Town">
                  <xAL:LocalityName>Rotterdam</xAL:LocalityName>
                  <xAL:Thoroughfare Type="Street">
                    <xAL:ThoroughfareNumber>42-38</xAL:ThoroughfareNumber>
                    <xAL:ThoroughfareName>Wijnhaven</xAL:ThoroughfareName>
                  </xAL:Thoroughfare>
                  <xAL:PostalCode>
                    <xAL:PostalCodeNumber>3011XA</xAL:PostalCodeNumber>
                  </xAL:PostalCode>
                </xAL:Locality>
              </xAL:Country>
            </xAL:AddressDetails>
          </xalAddress>
          <multiPoint>
            <gml:MultiPoint>
              <gml:pointMember>
                <gml:Point>
                  <gml:pos srsDimension="3">93088.4089999999 436877.312 2.74946333333381</gml:pos>
                </gml:Point>
              </gml:pointMember>
            </gml:MultiPoint>
          </multiPoint>
        </Address>
      </bldg:address>
    </bldg:Building>
  </cityObjectMember>
  <cityObjectMember>
    <bldg:Building gml:id="ID_0599100100007689">
      <gml:boundedBy>
        <gml:Envelope srsName="urn:ogc:def:crs:EPSG::28992" srsDimension="3">
          <gml:lowerCorner>93621.994 437054.505 2.73398999999976</gml:lowerCorner>
          <gml:upperCorner>93625.374 437057.455 4.7456053996901</gml:upperCorner>
        </gml:Envelope>
      </gml:boundedBy>
      <creationDate>2019-06-11</creationDate>
      <gen:stringAttribute name="statusOmschr">
        <gen:value>Pand in gebruik</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="gebouwnummer">
        <gen:value>0599100100007689</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="typeOmschr">
        <gen:value>vrijstaand</gen:value>
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
        <app:Appearance gml:id="UUID_0d8f4e2c-7aea-499c-8cb6-8ca9a881b4ef">
          <app:theme>RhinoCity texturing</app:theme>
          <app:surfaceDataMember>
            <app:ParameterizedTexture gml:id="UUID_ce09a913-e637-4c26-9341-245827a8efb5">
              <app:imageURI>appearance/tex_12.jpg</app:imageURI>
              <app:textureType>specific</app:textureType>
              <app:wrapMode>border</app:wrapMode>
              <app:borderColor>0.0 0.0 0.0 1.0</app:borderColor>
              <app:target uri="#RCID_e7adeefd-b856-4966-9f87-5e17c4337bfc">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_e7adeefd-b856-4966-9f87-5e17c4337bfc_0_">0.060591 0.015873 0.357068 0.172524 0.304082 0.547422 0.007874 0.389375 0.060591 0.015873</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_254c3c83-e0fb-4f87-b941-329c5ad2f256">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_254c3c83-e0fb-4f87-b941-329c5ad2f256_0_">0.39426 0.015873 0.689625 0.169729 0.673626 0.4093 0.377953 0.254244 0.39426 0.015873</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_e65d93aa-f796-411f-9826-2dc2f5f24eaf">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_e65d93aa-f796-411f-9826-2dc2f5f24eaf_0_">0.282024 0.587302 0.457561 0.65012 0.412082 0.892733 0.23622 0.830711 0.282024 0.587302</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d228f461-4baa-43d2-8501-70d378631ae8">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d228f461-4baa-43d2-8501-70d378631ae8_0_">0.979847 0.39816 0.708661 0.26282 0.713655 0.015873 0.984494 0.152353 0.979847 0.39816</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9eb963ac-1251-4408-a105-6938dc9f018e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9eb963ac-1251-4408-a105-6938dc9f018e_0_">0.191085 0.908929 0.007874 0.833987 0.035013 0.587302 0.218117 0.661456 0.191085 0.908929</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
            </app:ParameterizedTexture>
          </app:surfaceDataMember>
        </app:Appearance>
      </app:appearance>
      <bldg:yearOfConstruction>2013</bldg:yearOfConstruction>
      <bldg:lod1Solid>
        <gml:Solid gml:id="ID_9bbf0ef2-59ea-4b18-9bc8-185dc597703a">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_60c187fb-410c-4b2b-b43c-024fa6b42bce">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_21c6c1ff-8136-428c-9266-a3c424ee15b0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_21c6c1ff-8136-428c-9266-a3c424ee15b0_0_">
                      <gml:posList srsDimension="3">93622.664 437054.505 4.73762425238083 93621.994 437056.575 4.73762425238083 93621.994 437056.575 2.73398999999976 93622.664 437054.505 2.73398999999976 93622.664 437054.505 4.73762425238083</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_939a6578-b1fa-485b-a0c0-d88e90295374">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_939a6578-b1fa-485b-a0c0-d88e90295374_0_">
                      <gml:posList srsDimension="3">93625.374 437055.395 4.73762425238083 93622.664 437054.505 4.73762425238083 93622.664 437054.505 2.73398999999976 93625.374 437055.395 2.73398999999976 93625.374 437055.395 4.73762425238083</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_edaca89b-6ca4-4d06-8dc9-0f6487b75d5d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_edaca89b-6ca4-4d06-8dc9-0f6487b75d5d_0_">
                      <gml:posList srsDimension="3">93625.374 437055.395 2.73398999999976 93624.704 437057.455 2.73398999999976 93624.704 437057.455 4.73762425238083 93625.374 437055.395 4.73762425238083 93625.374 437055.395 2.73398999999976</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b2c70d84-0d9e-4d39-8587-e91403d94710">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b2c70d84-0d9e-4d39-8587-e91403d94710_0_">
                      <gml:posList srsDimension="3">93624.704 437057.455 2.73398999999976 93621.994 437056.575 2.73398999999976 93621.994 437056.575 4.73762425238083 93624.704 437057.455 4.73762425238083 93624.704 437057.455 2.73398999999976</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b406f3b4-8f2a-41a3-9327-18afb7f4c723">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b406f3b4-8f2a-41a3-9327-18afb7f4c723_0_">
                      <gml:posList srsDimension="3">93624.704 437057.455 4.73762425238083 93621.994 437056.575 4.73762425238083 93622.664 437054.505 4.73762425238083 93625.374 437055.395 4.73762425238083 93624.704 437057.455 4.73762425238083</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_37d0fdf4-172c-43ae-8058-75689632c13a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_37d0fdf4-172c-43ae-8058-75689632c13a_0_">
                      <gml:posList srsDimension="3">93625.374 437055.395 2.73398999999976 93622.664 437054.505 2.73398999999976 93621.994 437056.575 2.73398999999976 93624.704 437057.455 2.73398999999976 93625.374 437055.395 2.73398999999976</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod1Solid>
      <bldg:lod2Solid>
        <gml:Solid gml:id="UUID_3e512564-2758-4b1c-91ce-d0faf497eef1">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_6afee3b8-ba09-4e27-8a77-65555c3ea165">
              <gml:surfaceMember xlink:href="#RCID_020e19c0-2d21-4def-9c1c-4feca6700f49"/>
              <gml:surfaceMember xlink:href="#RCID_e7adeefd-b856-4966-9f87-5e17c4337bfc"/>
              <gml:surfaceMember xlink:href="#RCID_254c3c83-e0fb-4f87-b941-329c5ad2f256"/>
              <gml:surfaceMember xlink:href="#RCID_e65d93aa-f796-411f-9826-2dc2f5f24eaf"/>
              <gml:surfaceMember xlink:href="#RCID_d228f461-4baa-43d2-8501-70d378631ae8"/>
              <gml:surfaceMember xlink:href="#RCID_9eb963ac-1251-4408-a105-6938dc9f018e"/>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod2Solid>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_da11d1cf-b31a-4836-a8c3-3b6345747d44">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_f556b3ef-94ad-4c51-9b9c-2860f7d71532">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_254c3c83-e0fb-4f87-b941-329c5ad2f256">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_254c3c83-e0fb-4f87-b941-329c5ad2f256_0_">
                      <gml:posList srsDimension="3">93624.704 437057.455 2.73398999999981 93621.994 437056.575 2.73398999999981 93621.994 437056.575 4.73915089237472 93624.704 437057.455 4.72964310507166 93624.704 437057.455 2.73398999999981</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_af0f572c-9c00-45fb-948a-1fe9b17b1111">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_6060e0f6-7b37-46e2-bf7f-f1cc2cf5aeb7">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e7adeefd-b856-4966-9f87-5e17c4337bfc">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e7adeefd-b856-4966-9f87-5e17c4337bfc_0_">
                      <gml:posList srsDimension="3">93624.704 437057.455 4.72964310507166 93621.994 437056.575 4.73915089237472 93622.664 437054.505 4.7456053996901 93625.374 437055.395 4.73605912105337 93624.704 437057.455 4.72964310507166</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:GroundSurface gml:id="UUID_1e7d6870-7ba9-49ad-b6b2-ba618df423c2">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_9cbd9e1e-083f-4011-a253-deaa826ec1a7">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_020e19c0-2d21-4def-9c1c-4feca6700f49">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_020e19c0-2d21-4def-9c1c-4feca6700f49_0_">
                      <gml:posList srsDimension="3">93625.374 437055.395 2.73398999999981 93622.664 437054.505 2.73398999999981 93621.994 437056.575 2.73398999999981 93624.704 437057.455 2.73398999999981 93625.374 437055.395 2.73398999999981</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:GroundSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_5c4adafb-9ac7-443b-9cf1-526d270df4e4">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_a6032e95-9525-4122-8757-1e06679cabb9">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e65d93aa-f796-411f-9826-2dc2f5f24eaf">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e65d93aa-f796-411f-9826-2dc2f5f24eaf_0_">
                      <gml:posList srsDimension="3">93625.374 437055.395 2.73398999999981 93624.704 437057.455 2.73398999999981 93624.704 437057.455 4.72964310507166 93625.374 437055.395 4.73605912105337 93625.374 437055.395 2.73398999999981</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_cefb8995-bdee-4e2a-afdb-aeed8a7048e1">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e0a61f5b-b5d2-4bf6-a673-1bd0bc96d971">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d228f461-4baa-43d2-8501-70d378631ae8">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d228f461-4baa-43d2-8501-70d378631ae8_0_">
                      <gml:posList srsDimension="3">93625.374 437055.395 4.73605912105337 93622.664 437054.505 4.7456053996901 93622.664 437054.505 2.73398999999981 93625.374 437055.395 2.73398999999981 93625.374 437055.395 4.73605912105337</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_e490bd13-ebfa-40c0-ba95-79083c11de5d">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_472ea294-9276-4370-91d6-af608038b9fc">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9eb963ac-1251-4408-a105-6938dc9f018e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9eb963ac-1251-4408-a105-6938dc9f018e_0_">
                      <gml:posList srsDimension="3">93622.664 437054.505 4.7456053996901 93621.994 437056.575 4.73915089237472 93621.994 437056.575 2.73398999999981 93622.664 437054.505 2.73398999999981 93622.664 437054.505 4.7456053996901</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:AddressDetails>
              <xAL:Country>
                <xAL:CountryName>Nederland</xAL:CountryName>
                <xAL:Locality Type="Town">
                  <xAL:LocalityName>Rotterdam</xAL:LocalityName>
                  <xAL:Thoroughfare Type="Street">
                    <xAL:ThoroughfareNumber>125</xAL:ThoroughfareNumber>
                    <xAL:ThoroughfareName>Oosterkade</xAL:ThoroughfareName>
                  </xAL:Thoroughfare>
                  <xAL:PostalCode>
                    <xAL:PostalCodeNumber>3011TV</xAL:PostalCodeNumber>
                  </xAL:PostalCode>
                </xAL:Locality>
              </xAL:Country>
            </xAL:AddressDetails>
          </xalAddress>
          <multiPoint>
            <gml:MultiPoint>
              <gml:pointMember>
                <gml:Point>
                  <gml:pos srsDimension="3">93623.344 437055.491666667 2.76776333333302</gml:pos>
                </gml:Point>
              </gml:pointMember>
            </gml:MultiPoint>
          </multiPoint>
        </Address>
      </bldg:address>
    </bldg:Building>
  </cityObjectMember>
  <cityObjectMember>
    <bldg:Building gml:id="ID_0599100000658109">
      <gml:boundedBy>
        <gml:Envelope srsName="urn:ogc:def:crs:EPSG::28992" srsDimension="3">
          <gml:lowerCorner>93334.38 437067.37 2.81776000000001</gml:lowerCorner>
          <gml:upperCorner>93343.724 437080.828 19.0903749672189</gml:upperCorner>
        </gml:Envelope>
      </gml:boundedBy>
      <creationDate>2019-06-11</creationDate>
      <gen:stringAttribute name="statusOmschr">
        <gen:value>Pand in gebruik</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="gebouwnummer">
        <gen:value>0599100000658109</gen:value>
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
        <app:Appearance gml:id="UUID_948ea203-1da4-4183-807a-4c4997c8720b">
          <app:theme>RhinoCity texturing</app:theme>
          <app:surfaceDataMember>
            <app:ParameterizedTexture gml:id="UUID_71b4a50d-ed6c-4456-bf83-edfd81cfbb72">
              <app:imageURI>appearance/tex_9.jpg</app:imageURI>
              <app:textureType>specific</app:textureType>
              <app:wrapMode>border</app:wrapMode>
              <app:borderColor>0.0 0.0 0.0 1.0</app:borderColor>
              <app:target uri="#RCID_b0df6309-8447-4e2e-97bc-1d8e371a937d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_b0df6309-8447-4e2e-97bc-1d8e371a937d_0_">0.001957 0.610074 0.022842 0.502935 0.076005 0.51996 0.053236 0.627008 0.001957 0.610074</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_89c9aa44-5b94-4d2a-aee0-a3b1e636b15b">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_89c9aa44-5b94-4d2a-aee0-a3b1e636b15b_0_">0.228963 0.567926 0.253809 0.502935 0.296349 0.511189 0.278655 0.556863 0.270787 0.577175 0.228963 0.567926</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_893f28a7-9e08-48d9-b14b-96960964c215">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_893f28a7-9e08-48d9-b14b-96960964c215_0_">0.928643 0.30664 0.823475 0.413272 0.755382 0.277887 0.886377 0.299626 0.928643 0.30664</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2565d085-085b-4496-9a25-9c7201f204ba">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2565d085-085b-4496-9a25-9c7201f204ba_0_">0.830488 0.502935 0.82747 0.526037 0.696673 0.504422 0.830488 0.502935</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_bb8ee808-b138-4ab1-9cb0-afd261e86abe">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_bb8ee808-b138-4ab1-9cb0-afd261e86abe_0_">0.691545 0.526244 0.55773 0.52774 0.560627 0.502935 0.691545 0.526244</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_04ca3393-48a6-415f-90e4-66f1c838d546">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_04ca3393-48a6-415f-90e4-66f1c838d546_0_">0.749858 0.443052 0.590998 0.417765 0.613481 0.277887 0.749858 0.443052</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_79daa8ac-98d4-4032-bd52-49d2c7fd5710">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_79daa8ac-98d4-4032-bd52-49d2c7fd5710_0_">0.487202 0.443052 0.350294 0.277887 0.585783 0.320071 0.487202 0.443052</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c1c7778d-c245-41e4-93b2-6e550f568d7c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c1c7778d-c245-41e4-93b2-6e550f568d7c_0_">0.001957 0.486142 0.081229 0.277887 0.124812 0.497149 0.001957 0.486142</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_32e5c92d-64df-4a83-8fcf-18bd22655a0e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_32e5c92d-64df-4a83-8fcf-18bd22655a0e_0_">0.22461 0.502935 0.213082 0.618469 0.080235 0.598292 0.22461 0.502935</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_5d6e8b14-6165-45fe-b737-830272c84c3c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_5d6e8b14-6165-45fe-b737-830272c84c3c_0_">0.503682 0.54938 0.452055 0.540678 0.464228 0.502935 0.513488 0.518775 0.503682 0.54938</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_e78b5eab-550e-4d87-9f8b-e16b8f4dc267">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_e78b5eab-550e-4d87-9f8b-e16b8f4dc267_0_">0.541054 0.540382 0.518591 0.536537 0.528172 0.506175 0.552836 0.502935 0.541054 0.540382</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_cef99843-9a0c-4ec8-ae0f-41f65049082e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_cef99843-9a0c-4ec8-ae0f-41f65049082e_0_">0.435283 0.562795 0.432094 0.573291 0.30137 0.551837 0.31648 0.502935 0.446953 0.524382 0.435283 0.562795</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_41cb2e55-cd96-4569-804a-d109874da27f">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_41cb2e55-cd96-4569-804a-d109874da27f_0_">0.876576 0.519047 0.835616 0.512644 0.838713 0.502935 0.879656 0.509338 0.876576 0.519047</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_aba9c400-9335-4b20-9ee3-1fc18d0baa78">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_aba9c400-9335-4b20-9ee3-1fc18d0baa78_0_">0.590998 0.183315 0.660061 0.001957 0.914675 0.036474 0.84313 0.228464 0.649092 0.202359 0.653138 0.191679 0.590998 0.183315</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_8f32622c-39e4-48d8-9020-2607c1c08bef">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_8f32622c-39e4-48d8-9020-2607c1c08bef_0_">0.249051 0.483951 0.260787 0.444841 0.129159 0.419965 0.172532 0.277887 0.345275 0.31068 0.291192 0.491905 0.249051 0.483951</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_32277ba1-9fc3-4ebe-90da-c1c9abbb6708">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_32277ba1-9fc3-4ebe-90da-c1c9abbb6708_0_">0.512797 0.19875 0.4604 0.18231 0.444455 0.231908 0.209393 0.193025 0.272609 0.001957 0.586025 0.054114 0.540973 0.195659 0.512797 0.19875</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c229a66e-4f79-40a7-a1d2-3db1457086a0">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c229a66e-4f79-40a7-a1d2-3db1457086a0_0_">0.055278 0.195593 0.001957 0.001957 0.149841 0.028856 0.204124 0.222508 0.141998 0.273151 0.055278 0.195593</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
            </app:ParameterizedTexture>
          </app:surfaceDataMember>
        </app:Appearance>
      </app:appearance>
      <bldg:yearOfConstruction>1608</bldg:yearOfConstruction>
      <bldg:lod1Solid>
        <gml:Solid gml:id="ID_2e9eba29-0fd2-4d40-a6da-e73edd9ba331">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_3ce1edde-9112-4f95-a0e5-1e92f8ef217d">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_da330eec-beeb-4914-977e-3b8217378a4b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_da330eec-beeb-4914-977e-3b8217378a4b_0_">
                      <gml:posList srsDimension="3">93341.003 437080.828 2.81776000000001 93334.38 437079.25 2.81776000000001 93334.38 437079.25 17.0559999672189 93341.003 437080.828 17.0559999672189 93341.003 437080.828 2.81776000000001</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0407c905-5335-42cf-a7d1-3607bdd3efcf">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0407c905-5335-42cf-a7d1-3607bdd3efcf_0_">
                      <gml:posList srsDimension="3">93337.095 437067.37 17.0559999672189 93334.38 437079.25 17.0559999672189 93334.38 437079.25 2.81776000000001 93337.095 437067.37 2.81776000000001 93337.095 437067.37 17.0559999672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_dd7c2a7b-68f9-4312-aaa8-234ab93aef03">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_dd7c2a7b-68f9-4312-aaa8-234ab93aef03_0_">
                      <gml:posList srsDimension="3">93343.724 437069.093 17.0559999672189 93337.095 437067.37 17.0559999672189 93337.095 437067.37 2.81776000000001 93343.724 437069.093 2.81776000000001 93343.724 437069.093 17.0559999672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9ec4df2f-883c-4a65-9ea1-16184c40bb08">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9ec4df2f-883c-4a65-9ea1-16184c40bb08_0_">
                      <gml:posList srsDimension="3">93343.724 437069.093 2.81776000000001 93341.003 437080.828 2.81776000000001 93341.003 437080.828 17.0559999672189 93343.724 437069.093 17.0559999672189 93343.724 437069.093 2.81776000000001</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5a329def-9800-4d08-b9bc-9c95af20fd8c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5a329def-9800-4d08-b9bc-9c95af20fd8c_0_">
                      <gml:posList srsDimension="3">93341.003 437080.828 17.0559999672189 93334.38 437079.25 17.0559999672189 93337.095 437067.37 17.0559999672189 93343.724 437069.093 17.0559999672189 93341.003 437080.828 17.0559999672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b462cd5e-f57b-4b6a-8ffc-c7c9d7fca7f8">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b462cd5e-f57b-4b6a-8ffc-c7c9d7fca7f8_0_">
                      <gml:posList srsDimension="3">93343.724 437069.093 2.81776000000001 93337.095 437067.37 2.81776000000001 93334.38 437079.25 2.81776000000001 93341.003 437080.828 2.81776000000001 93343.724 437069.093 2.81776000000001</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod1Solid>
      <bldg:lod2Solid>
        <gml:Solid gml:id="UUID_9be2bca9-c4ae-48b1-8267-a7d97137e958">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_f7d84cda-0fc5-4be0-ae86-515bd155e8db">
              <gml:surfaceMember xlink:href="#RCID_4b94f417-add9-4d47-b7de-ba304ea92c85"/>
              <gml:surfaceMember xlink:href="#RCID_b0df6309-8447-4e2e-97bc-1d8e371a937d"/>
              <gml:surfaceMember xlink:href="#RCID_89c9aa44-5b94-4d2a-aee0-a3b1e636b15b"/>
              <gml:surfaceMember xlink:href="#RCID_893f28a7-9e08-48d9-b14b-96960964c215"/>
              <gml:surfaceMember xlink:href="#RCID_2565d085-085b-4496-9a25-9c7201f204ba"/>
              <gml:surfaceMember xlink:href="#RCID_bb8ee808-b138-4ab1-9cb0-afd261e86abe"/>
              <gml:surfaceMember xlink:href="#RCID_04ca3393-48a6-415f-90e4-66f1c838d546"/>
              <gml:surfaceMember xlink:href="#RCID_79daa8ac-98d4-4032-bd52-49d2c7fd5710"/>
              <gml:surfaceMember xlink:href="#RCID_c1c7778d-c245-41e4-93b2-6e550f568d7c"/>
              <gml:surfaceMember xlink:href="#RCID_32e5c92d-64df-4a83-8fcf-18bd22655a0e"/>
              <gml:surfaceMember xlink:href="#RCID_5d6e8b14-6165-45fe-b737-830272c84c3c"/>
              <gml:surfaceMember xlink:href="#RCID_e78b5eab-550e-4d87-9f8b-e16b8f4dc267"/>
              <gml:surfaceMember xlink:href="#RCID_cef99843-9a0c-4ec8-ae0f-41f65049082e"/>
              <gml:surfaceMember xlink:href="#RCID_41cb2e55-cd96-4569-804a-d109874da27f"/>
              <gml:surfaceMember xlink:href="#RCID_aba9c400-9335-4b20-9ee3-1fc18d0baa78"/>
              <gml:surfaceMember xlink:href="#RCID_8f32622c-39e4-48d8-9020-2607c1c08bef"/>
              <gml:surfaceMember xlink:href="#RCID_32277ba1-9fc3-4ebe-90da-c1c9abbb6708"/>
              <gml:surfaceMember xlink:href="#RCID_c229a66e-4f79-40a7-a1d2-3db1457086a0"/>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod2Solid>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_0d296bab-8877-40de-9195-a7df611579cf">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_6d3d20e4-58c1-482b-9836-81f14815647f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_32277ba1-9fc3-4ebe-90da-c1c9abbb6708">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_32277ba1-9fc3-4ebe-90da-c1c9abbb6708_0_">
                      <gml:posList srsDimension="3">93336.8722365019 437068.344744146 12.3403749672189 93336.4001178752 437070.410589187 11.8716249672189 93336.4001178752 437070.410589187 15.0216249672189 93334.38 437079.25 15.0216249672189 93334.38 437079.25 2.81776000000001 93337.095 437067.37 2.81776000000001 93337.095 437067.37 11.8716249672189 93336.8722365019 437068.344744146 12.3403749672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_3388f7d1-ca65-4acd-b97a-62e4d54727f8">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_938ca6b5-2949-4193-83f3-fedaec911a87">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c229a66e-4f79-40a7-a1d2-3db1457086a0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c229a66e-4f79-40a7-a1d2-3db1457086a0_0_">
                      <gml:posList srsDimension="3">93341.003 437080.828 15.0216249672189 93341.003 437080.828 2.81776000000001 93334.38 437079.25 2.81776000000001 93334.38 437079.25 15.0216249672189 93337.9506337723 437080.10074137 19.0903749672189 93341.003 437080.828 15.0216249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_a68d5f30-f44e-4392-8044-b2e095d3b026">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_31cf279d-0e37-49ce-a943-48f40b0ef194">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_cef99843-9a0c-4ec8-ae0f-41f65049082e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_cef99843-9a0c-4ec8-ae0f-41f65049082e_0_">
                      <gml:posList srsDimension="3">93341.4376652551 437071.564741093 14.3466249672189 93341.4376652551 437071.564741093 15.0216249672189 93336.4001178752 437070.410589187 15.0216249672189 93336.4001178752 437070.410589187 11.8716249672189 93341.4376652551 437071.564741093 11.8716249672189 93341.4376652551 437071.564741093 14.3466249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_41cb2e55-cd96-4569-804a-d109874da27f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_41cb2e55-cd96-4569-804a-d109874da27f_0_">
                      <gml:posList srsDimension="3">93343.0644549449 437071.937454694 15.0216249672189 93341.4376652551 437071.564741093 15.0216249672189 93341.4376652551 437071.564741093 14.3466249672189 93343.0644549449 437071.937454694 14.3466249672189 93343.0644549449 437071.937454694 15.0216249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d0c7ba72-d2f4-4881-8b59-93176e3d3253">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e1bc804a-741e-4478-937f-a246c93202ad">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_aba9c400-9335-4b20-9ee3-1fc18d0baa78">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_aba9c400-9335-4b20-9ee3-1fc18d0baa78_0_">
                      <gml:posList srsDimension="3">93343.724 437069.093 14.3466249672189 93343.724 437069.093 2.81776000000001 93341.003 437080.828 2.81776000000001 93341.003 437080.828 15.0216249672189 93343.0644549449 437071.937454694 15.0216249672189 93343.0644549449 437071.937454694 14.3466249672189 93343.724 437069.093 14.3466249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_33be61fd-e635-4506-ab04-bac7cc724198">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_3eb448df-b093-487d-b6f2-4017a05926d6">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8f32622c-39e4-48d8-9020-2607c1c08bef">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8f32622c-39e4-48d8-9020-2607c1c08bef_0_">
                      <gml:posList srsDimension="3">93342.1170388505 437068.675321005 14.3466249672189 93342.1170388505 437068.675321005 11.8716249672189 93337.095 437067.37 11.8716249672189 93337.095 437067.37 2.81776000000001 93343.724 437069.093 2.81776000000001 93343.724 437069.093 14.3466249672189 93342.1170388505 437068.675321005 14.3466249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_e30ae212-9804-4555-8715-7a9a805fa0b3">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2e38c22e-59a0-44f1-8549-49e6644a8e7e">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5d6e8b14-6165-45fe-b737-830272c84c3c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5d6e8b14-6165-45fe-b737-830272c84c3c_0_">
                      <gml:posList srsDimension="3">93341.9076466589 437069.565879614 14.3466249672189 93341.4376652551 437071.564741093 14.3466249672189 93341.4376652551 437071.564741093 11.8716249672189 93341.9076466589 437069.565879614 12.3403749672189 93341.9076466589 437069.565879614 14.3466249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e78b5eab-550e-4d87-9f8b-e16b8f4dc267">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e78b5eab-550e-4d87-9f8b-e16b8f4dc267_0_">
                      <gml:posList srsDimension="3">93342.1170388505 437068.675321005 14.3466249672189 93341.9076466589 437069.565879614 14.3466249672189 93341.9076466589 437069.565879614 12.3403749672189 93342.1170388505 437068.675321005 11.8716249672189 93342.1170388505 437068.675321005 14.3466249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_eb697b66-3b10-49f3-8074-9933bb06915a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_d30995b0-ea67-4ab5-8cd8-7f63c1a18322">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c1c7778d-c245-41e4-93b2-6e550f568d7c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c1c7778d-c245-41e4-93b2-6e550f568d7c_0_">
                      <gml:posList srsDimension="3">93343.0644549449 437071.937454694 15.0216249672189 93341.003 437080.828 15.0216249672189 93339.1764344327 437074.110281489 19.0809999672189 93343.0644549449 437071.937454694 15.0216249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_32e5c92d-64df-4a83-8fcf-18bd22655a0e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_32e5c92d-64df-4a83-8fcf-18bd22655a0e_0_">
                      <gml:posList srsDimension="3">93341.003 437080.828 15.0216249672189 93337.9506337723 437080.10074137 19.0903749672189 93339.1764344327 437074.110281489 19.0809999672189 93341.003 437080.828 15.0216249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_327f3754-b1cb-4cae-b891-616ae6139ec6">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_7621c241-8e7f-40cd-95c9-2b10b2fac015">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_04ca3393-48a6-415f-90e4-66f1c838d546">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_04ca3393-48a6-415f-90e4-66f1c838d546_0_">
                      <gml:posList srsDimension="3">93339.1764344327 437074.110281489 19.0809999672189 93337.9506337723 437080.10074137 19.0903749672189 93334.38 437079.25 15.0216249672189 93339.1764344327 437074.110281489 19.0809999672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_79daa8ac-98d4-4032-bd52-49d2c7fd5710">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_79daa8ac-98d4-4032-bd52-49d2c7fd5710_0_">
                      <gml:posList srsDimension="3">93339.1764344327 437074.110281489 19.0809999672189 93334.38 437079.25 15.0216249672189 93336.4001178752 437070.410589187 15.0216249672189 93339.1764344327 437074.110281489 19.0809999672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_8b3497ea-5f05-4426-bbae-70a960723387">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_5de3b680-806d-4d02-baa3-52ed96e3666f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2565d085-085b-4496-9a25-9c7201f204ba">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2565d085-085b-4496-9a25-9c7201f204ba_0_">
                      <gml:posList srsDimension="3">93342.1170388505 437068.675321005 11.8716249672189 93341.9076466589 437069.565879614 12.3403749672189 93336.8722365019 437068.344744146 12.3403749672189 93342.1170388505 437068.675321005 11.8716249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_bb8ee808-b138-4ab1-9cb0-afd261e86abe">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_bb8ee808-b138-4ab1-9cb0-afd261e86abe_0_">
                      <gml:posList srsDimension="3">93342.1170388505 437068.675321005 11.8716249672189 93336.8722365019 437068.344744146 12.3403749672189 93337.095 437067.37 11.8716249672189 93342.1170388505 437068.675321005 11.8716249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_7ae15eb3-7554-4947-82a8-3f1e5ea75e0f">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_931627b9-0f37-42a8-9b5a-3e23c41f63ae">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_893f28a7-9e08-48d9-b14b-96960964c215">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_893f28a7-9e08-48d9-b14b-96960964c215_0_">
                      <gml:posList srsDimension="3">93343.0644549449 437071.937454694 15.0216249672189 93339.1764344327 437074.110281489 19.0809999672189 93336.4001178752 437070.410589187 15.0216249672189 93341.4376652551 437071.564741093 15.0216249672189 93343.0644549449 437071.937454694 15.0216249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_15ea65f6-8e90-4fe5-aff4-69ffe216c2a0">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c8e250a1-939b-44ae-80fe-bc85fa194b1c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_89c9aa44-5b94-4d2a-aee0-a3b1e636b15b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_89c9aa44-5b94-4d2a-aee0-a3b1e636b15b_0_">
                      <gml:posList srsDimension="3">93343.724 437069.093 14.3466249672189 93343.0644549449 437071.937454694 14.3466249672189 93341.4376652551 437071.564741093 14.3466249672189 93341.9076466589 437069.565879614 14.3466249672189 93342.1170388505 437068.675321005 14.3466249672189 93343.724 437069.093 14.3466249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_4bd44930-7d2c-4ef4-aade-93871c2ceb59">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_9590b71f-cbe8-4e73-8e97-be9531f77d0c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b0df6309-8447-4e2e-97bc-1d8e371a937d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b0df6309-8447-4e2e-97bc-1d8e371a937d_0_">
                      <gml:posList srsDimension="3">93341.4376652551 437071.564741093 11.8716249672189 93336.4001178752 437070.410589187 11.8716249672189 93336.8722365019 437068.344744146 12.3403749672189 93341.9076466589 437069.565879614 12.3403749672189 93341.4376652551 437071.564741093 11.8716249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:GroundSurface gml:id="UUID_2c6191a3-7705-4d53-9dc5-579a72eb8e55">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c20f2d48-658d-4744-85ab-44c89d587d82">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4b94f417-add9-4d47-b7de-ba304ea92c85">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4b94f417-add9-4d47-b7de-ba304ea92c85_0_">
                      <gml:posList srsDimension="3">93343.724 437069.093 2.81776000000001 93337.095 437067.37 2.81776000000001 93334.38 437079.25 2.81776000000001 93341.003 437080.828 2.81776000000001 93343.724 437069.093 2.81776000000001</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:GroundSurface>
      </bldg:boundedBy>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:AddressDetails>
              <xAL:Country>
                <xAL:CountryName>Nederland</xAL:CountryName>
                <xAL:Locality Type="Town">
                  <xAL:LocalityName>Rotterdam</xAL:LocalityName>
                  <xAL:Thoroughfare Type="Street">
                    <xAL:ThoroughfareNumber>22</xAL:ThoroughfareNumber>
                    <xAL:ThoroughfareName>Oost-Wijnstraat</xAL:ThoroughfareName>
                  </xAL:Thoroughfare>
                  <xAL:PostalCode>
                    <xAL:PostalCodeNumber>3011TZ</xAL:PostalCodeNumber>
                  </xAL:PostalCode>
                </xAL:Locality>
              </xAL:Country>
            </xAL:AddressDetails>
          </xalAddress>
          <multiPoint>
            <gml:MultiPoint>
              <gml:pointMember>
                <gml:Point>
                  <gml:pos srsDimension="3">93338.3996666667 437071.904333333 2.86168666666687</gml:pos>
                </gml:Point>
              </gml:pointMember>
            </gml:MultiPoint>
          </multiPoint>
        </Address>
      </bldg:address>
    </bldg:Building>
  </cityObjectMember>
  <cityObjectMember>
    <bldg:Building gml:id="ID_0599100000648669">
      <gml:boundedBy>
        <gml:Envelope srsName="urn:ogc:def:crs:EPSG::28992" srsDimension="3">
          <gml:lowerCorner>93943.16 437208.87 0.25790000005357</gml:lowerCorner>
          <gml:upperCorner>93947.37 437214.51 11.3493331730845</gml:upperCorner>
        </gml:Envelope>
      </gml:boundedBy>
      <creationDate>2019-06-11</creationDate>
      <gen:stringAttribute name="statusOmschr">
        <gen:value>Pand in gebruik</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="gebouwnummer">
        <gen:value>0599100000648669</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="typeOmschr">
        <gen:value>tussenpand</gen:value>
      </gen:stringAttribute>
      <gen:intAttribute name="aantalBouwlagen">
        <gen:value>4</gen:value>
      </gen:intAttribute>
      <gen:intAttribute name="hoogste_bouwlaag">
        <gen:value>1</gen:value>
      </gen:intAttribute>
      <gen:intAttribute name="laagste_bouwlaag">
        <gen:value>1</gen:value>
      </gen:intAttribute>
      <app:appearance>
        <app:Appearance gml:id="UUID_72f94a3c-3bfc-4f2b-b493-379b57fac167">
          <app:theme>RhinoCity texturing</app:theme>
          <app:surfaceDataMember>
            <app:ParameterizedTexture gml:id="UUID_2d3a16e8-f66f-4083-90bd-7b3633d59454">
              <app:imageURI>appearance/tex_15.jpg</app:imageURI>
              <app:textureType>specific</app:textureType>
              <app:wrapMode>border</app:wrapMode>
              <app:borderColor>0.0 0.0 0.0 1.0</app:borderColor>
              <app:target uri="#RCID_0bfa76be-7eb3-4ed1-81f2-235bfc15f426">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_0bfa76be-7eb3-4ed1-81f2-235bfc15f426_0_">0.282353 0.388235 0.462187 0.406038 0.470201 0.612983 0.290099 0.591311 0.282353 0.388235</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_04de6fc5-4037-4c08-9e83-1880f242a561">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_04de6fc5-4037-4c08-9e83-1880f242a561_0_">0.141227 0.003922 0.387131 0.0261 0.251366 0.377409 0.003922 0.355184 0.141227 0.003922</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_3b4f5e9d-580d-4611-b619-706cc2ee7d04">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_3b4f5e9d-580d-4611-b619-706cc2ee7d04_0_">0.983846 0.372464 0.826086 0.355163 0.74902 0.003922 0.905927 0.02154 0.983846 0.372464</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_fd7149fc-3589-4d4f-83ba-6af8098ed4bf">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_fd7149fc-3589-4d4f-83ba-6af8098ed4bf_0_">0.626523 0.373402 0.396078 0.354548 0.511725 0.003922 0.740831 0.022823 0.626523 0.373402</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_51b7819e-433e-4d36-8ad1-93fd89654d23">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_51b7819e-433e-4d36-8ad1-93fd89654d23_0_">0.094535 0.388235 0.274355 0.405808 0.18488 0.750783 0.003922 0.732866 0.094535 0.388235</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
            </app:ParameterizedTexture>
          </app:surfaceDataMember>
        </app:Appearance>
      </app:appearance>
      <bldg:yearOfConstruction>1968</bldg:yearOfConstruction>
      <bldg:lod1Solid>
        <gml:Solid gml:id="ID_542fe96d-cbc2-4a80-b155-3640d6b36da2">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_29c3f415-bb32-4c7b-9c48-16e379e56058">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6eca2462-6b90-4c0f-b734-d9068ebe6102">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6eca2462-6b90-4c0f-b734-d9068ebe6102_0_">
                      <gml:posList srsDimension="3">93946.68 437214.51 0.25790000005357 93943.16 437214.06 0.25790000005357 93943.16 437214.06 11.343710635431 93946.68 437214.51 11.343710635431 93946.68 437214.51 0.25790000005357</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0d765b7f-4c63-4f8f-a4c1-a93e8eee67b0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0d765b7f-4c63-4f8f-a4c1-a93e8eee67b0_0_">
                      <gml:posList srsDimension="3">93943.85 437208.87 11.343710635431 93943.16 437214.06 11.343710635431 93943.16 437214.06 0.25790000005357 93943.85 437208.87 0.25790000005357 93943.85 437208.87 11.343710635431</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_962c72ef-3f6d-4976-889c-7db5189b3fce">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_962c72ef-3f6d-4976-889c-7db5189b3fce_0_">
                      <gml:posList srsDimension="3">93947.37 437209.42 11.343710635431 93943.85 437208.87 11.343710635431 93943.85 437208.87 0.25790000005357 93947.37 437209.42 0.25790000005357 93947.37 437209.42 11.343710635431</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7e974e4e-f845-4730-be14-b0914a0667d1">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7e974e4e-f845-4730-be14-b0914a0667d1_0_">
                      <gml:posList srsDimension="3">93947.37 437209.42 0.25790000005357 93946.68 437214.51 0.25790000005357 93946.68 437214.51 11.343710635431 93947.37 437209.42 11.343710635431 93947.37 437209.42 0.25790000005357</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d12faeac-377c-43b6-872b-250009875dbd">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d12faeac-377c-43b6-872b-250009875dbd_0_">
                      <gml:posList srsDimension="3">93946.68 437214.51 11.343710635431 93943.16 437214.06 11.343710635431 93943.85 437208.87 11.343710635431 93947.37 437209.42 11.343710635431 93946.68 437214.51 11.343710635431</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_12252d1b-1986-47bb-b821-25ba33051fbc">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_12252d1b-1986-47bb-b821-25ba33051fbc_0_">
                      <gml:posList srsDimension="3">93947.37 437209.42 0.25790000005357 93943.85 437208.87 0.25790000005357 93943.16 437214.06 0.25790000005357 93946.68 437214.51 0.25790000005357 93947.37 437209.42 0.25790000005357</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod1Solid>
      <bldg:lod2Solid>
        <gml:Solid gml:id="UUID_9c44b320-0999-4ade-875f-1a0573a51647">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_46cbe1ad-c01d-471c-b5d3-e3c41be07319">
              <gml:surfaceMember xlink:href="#RCID_b40baf75-ffb1-4a38-b4f7-3988142dd782"/>
              <gml:surfaceMember xlink:href="#RCID_0bfa76be-7eb3-4ed1-81f2-235bfc15f426"/>
              <gml:surfaceMember xlink:href="#RCID_04de6fc5-4037-4c08-9e83-1880f242a561"/>
              <gml:surfaceMember xlink:href="#RCID_3b4f5e9d-580d-4611-b619-706cc2ee7d04"/>
              <gml:surfaceMember xlink:href="#RCID_fd7149fc-3589-4d4f-83ba-6af8098ed4bf"/>
              <gml:surfaceMember xlink:href="#RCID_51b7819e-433e-4d36-8ad1-93fd89654d23"/>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod2Solid>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_165b2b94-787b-4e0b-bdb8-8ce00503f136">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_ff84fb5e-594c-4199-866c-c680e043c286">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_04de6fc5-4037-4c08-9e83-1880f242a561">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_04de6fc5-4037-4c08-9e83-1880f242a561_0_">
                      <gml:posList srsDimension="3">93947.37 437209.42 0.257900000053617 93946.68 437214.51 0.257900000053617 93946.68 437214.51 11.3392591921362 93947.37 437209.42 11.3380880977776 93947.37 437209.42 0.257900000053617</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_26951caf-7a25-47e1-97fb-e1492f9d1de9">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_1e14cfa1-e404-4da3-826f-3b6f62792bd0">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0bfa76be-7eb3-4ed1-81f2-235bfc15f426">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0bfa76be-7eb3-4ed1-81f2-235bfc15f426_0_">
                      <gml:posList srsDimension="3">93946.68 437214.51 11.3392591921362 93943.16 437214.06 11.3493331730845 93943.85 437208.87 11.3481775982747 93947.37 437209.42 11.3380880977776 93946.68 437214.51 11.3392591921362</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:GroundSurface gml:id="UUID_df383b6a-707f-46a3-902d-c103a96d89f3">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c01383cd-4a5d-4e39-8404-745a33b4c320">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b40baf75-ffb1-4a38-b4f7-3988142dd782">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b40baf75-ffb1-4a38-b4f7-3988142dd782_0_">
                      <gml:posList srsDimension="3">93947.37 437209.42 0.257900000053617 93943.85 437208.87 0.257900000053617 93943.16 437214.06 0.257900000053617 93946.68 437214.51 0.257900000053617 93947.37 437209.42 0.257900000053617</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:GroundSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_6ac25740-b7b8-45f4-ac45-b7521ca4648b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_79623710-4c80-4e36-a6cf-1726b47742a7">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3b4f5e9d-580d-4611-b619-706cc2ee7d04">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3b4f5e9d-580d-4611-b619-706cc2ee7d04_0_">
                      <gml:posList srsDimension="3">93947.37 437209.42 11.3380880977776 93943.85 437208.87 11.3481775982747 93943.85 437208.87 0.257900000053617 93947.37 437209.42 0.257900000053617 93947.37 437209.42 11.3380880977776</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_4441d077-5d4e-4719-9dcb-8118cf16105b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_7044f787-6230-45d9-bf5f-2a55acd9dc0c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_fd7149fc-3589-4d4f-83ba-6af8098ed4bf">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_fd7149fc-3589-4d4f-83ba-6af8098ed4bf_0_">
                      <gml:posList srsDimension="3">93943.85 437208.87 11.3481775982747 93943.16 437214.06 11.3493331730845 93943.16 437214.06 0.257900000053617 93943.85 437208.87 0.257900000053617 93943.85 437208.87 11.3481775982747</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_307f5dd0-cbf9-4610-8b8d-0533f104ec8a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_bdec8945-6ae0-4e96-a560-9905861a850b">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_51b7819e-433e-4d36-8ad1-93fd89654d23">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_51b7819e-433e-4d36-8ad1-93fd89654d23_0_">
                      <gml:posList srsDimension="3">93946.68 437214.51 0.257900000053617 93943.16 437214.06 0.257900000053617 93943.16 437214.06 11.3493331730845 93946.68 437214.51 11.3392591921362 93946.68 437214.51 0.257900000053617</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:AddressDetails>
              <xAL:Country>
                <xAL:CountryName>Nederland</xAL:CountryName>
                <xAL:Locality Type="Town">
                  <xAL:LocalityName>Rotterdam</xAL:LocalityName>
                  <xAL:Thoroughfare Type="Street">
                    <xAL:ThoroughfareNumber>110</xAL:ThoroughfareNumber>
                    <xAL:ThoroughfareName>Maasboulevard</xAL:ThoroughfareName>
                  </xAL:Thoroughfare>
                  <xAL:PostalCode>
                    <xAL:PostalCodeNumber>3011TX</xAL:PostalCodeNumber>
                  </xAL:PostalCode>
                </xAL:Locality>
              </xAL:Country>
            </xAL:AddressDetails>
          </xalAddress>
          <multiPoint>
            <gml:MultiPoint>
              <gml:pointMember>
                <gml:Point>
                  <gml:pos srsDimension="3">93945.9666666667 437210.933333333 3.01606666665705</gml:pos>
                </gml:Point>
              </gml:pointMember>
            </gml:MultiPoint>
          </multiPoint>
        </Address>
      </bldg:address>
    </bldg:Building>
  </cityObjectMember>
  <cityObjectMember>
    <bldg:Building gml:id="ID_0599100000755951">
      <gml:boundedBy>
        <gml:Envelope srsName="urn:ogc:def:crs:EPSG::28992" srsDimension="3">
          <gml:lowerCorner>93366.729 437065.78 2.77000000000002</gml:lowerCorner>
          <gml:upperCorner>93377.663 437088.3 18.1622499672188</gml:upperCorner>
        </gml:Envelope>
      </gml:boundedBy>
      <creationDate>2019-06-11</creationDate>
      <gen:stringAttribute name="statusOmschr">
        <gen:value>Pand in gebruik</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="gebouwnummer">
        <gen:value>0599100000755951</gen:value>
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
        <app:Appearance gml:id="UUID_ebaf6a74-f29b-415c-a369-533c9e640b81">
          <app:theme>RhinoCity texturing</app:theme>
          <app:surfaceDataMember>
            <app:ParameterizedTexture gml:id="UUID_844e7f8b-d2da-4a0a-8975-7b2a95d82050">
              <app:imageURI>appearance/tex_19.jpg</app:imageURI>
              <app:textureType>specific</app:textureType>
              <app:wrapMode>border</app:wrapMode>
              <app:borderColor>0.0 0.0 0.0 1.0</app:borderColor>
              <app:target uri="#RCID_bb06234f-5e8d-4f48-b8cc-fad2aca8f70d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_bb06234f-5e8d-4f48-b8cc-fad2aca8f70d_0_">0.18985 0.667319 0.257972 0.679352 0.226219 0.779151 0.16047 0.759275 0.18985 0.667319</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_a41dd33b-076a-476a-bc6a-c8a2c83a412d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_a41dd33b-076a-476a-bc6a-c8a2c83a412d_0_">0.001957 0.322102 0.127193 0.001957 0.276738 0.032896 0.149851 0.348188 0.100213 0.339432 0.031199 0.32726 0.001957 0.322102</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_59a7a692-0f35-4a15-ae76-91f89e2f4d1a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_59a7a692-0f35-4a15-ae76-91f89e2f4d1a_0_">0.007812 0.667319 0.156462 0.698274 0.15068 0.794197 0.001957 0.763554 0.007812 0.667319</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_cdb274bb-d244-4aa6-9552-a696fff7b3cc">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_cdb274bb-d244-4aa6-9552-a696fff7b3cc_0_">0.714286 0.667319 0.839931 0.692209 0.753202 0.741949 0.714286 0.667319</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c5a8e0f0-d71e-4c7f-94b5-1fb7b7dd5197">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c5a8e0f0-d71e-4c7f-94b5-1fb7b7dd5197_0_">0.088146 0.798434 0.091456 0.861221 0.001957 0.84795 0.088146 0.798434</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_e54d080a-2cf8-4175-b0ae-530fdafaa8a4">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_e54d080a-2cf8-4175-b0ae-530fdafaa8a4_0_">0.960767 0.667319 0.911477 0.738995 0.845401 0.722343 0.960767 0.667319</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d3c66402-c338-4d9f-8aa3-e453cba2cf90">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d3c66402-c338-4d9f-8aa3-e453cba2cf90_0_">0.70938 0.699571 0.593688 0.754854 0.571429 0.667319 0.70938 0.699571</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d8ead377-b38f-4fef-948b-e1e4246b8998">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d8ead377-b38f-4fef-948b-e1e4246b8998_0_">0.566373 0.755233 0.544031 0.667319 0.545536 0.667698 0.566373 0.755233</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_fcb16800-9205-42cb-8bcd-136ae9997760">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_fcb16800-9205-42cb-8bcd-136ae9997760_0_">0.363228 0.765527 0.262231 0.667319 0.423464 0.700128 0.363228 0.765527</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_b2b84c51-b272-4e52-9b97-e63f8520a912">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_b2b84c51-b272-4e52-9b97-e63f8520a912_0_">0.540096 0.765527 0.428571 0.748858 0.439645 0.667319 0.540096 0.765527</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_bf3d4141-4a18-4dcd-a0eb-104204f6219c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_bf3d4141-4a18-4dcd-a0eb-104204f6219c_0_">0.142207 0.85601 0.09589 0.848859 0.109536 0.798434 0.143968 0.84946 0.142207 0.85601</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_5c1c8ddc-0713-4a9f-9bf1-c589a6c3f29b">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_5c1c8ddc-0713-4a9f-9bf1-c589a6c3f29b_0_">0.17576 0.848618 0.148728 0.844435 0.150459 0.837916 0.189036 0.798434 0.17576 0.848618</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_1cf83e15-f880-46a4-ac26-8c01af730b52">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_1cf83e15-f880-46a4-ac26-8c01af730b52_0_">0.258776 0.813573 0.193738 0.804451 0.195518 0.798434 0.26054 0.807556 0.258776 0.813573</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_24e67e6b-6d40-4ec3-bac3-adc11c469c14">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_24e67e6b-6d40-4ec3-bac3-adc11c469c14_0_">0.128643 0.563553 0.001957 0.544244 0.077541 0.35225 0.541089 0.423436 0.471998 0.605955 0.412763 0.661673 0.108452 0.615386 0.128643 0.563553</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_88ce5c7a-eeb2-468d-9c1c-8541c80284cb">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_88ce5c7a-eeb2-468d-9c1c-8541c80284cb_0_">0.921337 0.543216 0.919765 0.542832 0.970466 0.35225 0.972027 0.352634 0.921337 0.543216</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_a558f927-d5a3-4735-8c2c-b0312695c447">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_a558f927-d5a3-4735-8c2c-b0312695c447_0_">0.684455 0.575803 0.545988 0.543118 0.598019 0.35225 0.735451 0.38489 0.684455 0.575803</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_74ab01a4-0ebb-47da-ba55-250394004c2f">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_74ab01a4-0ebb-47da-ba55-250394004c2f_0_">0.672445 0.267539 0.656489 0.319307 0.304223 0.253002 0.2818 0.183942 0.340682 0.001957 0.89294 0.106724 0.835131 0.298211 0.672445 0.267539</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_f94bf9b3-95a9-4d9c-815c-1ef464ebaff1">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_f94bf9b3-95a9-4d9c-815c-1ef464ebaff1_0_">0.739726 0.35225 0.887512 0.383303 0.915654 0.557537 0.766777 0.526403 0.739726 0.35225</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
            </app:ParameterizedTexture>
          </app:surfaceDataMember>
        </app:Appearance>
      </app:appearance>
      <bldg:yearOfConstruction>1615</bldg:yearOfConstruction>
      <bldg:lod1Solid>
        <gml:Solid gml:id="ID_71f1765d-3048-463d-9810-cbb18dbbc927">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_37225aad-7e98-4b54-8dde-8bf33f1aa65a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_cc436b84-88d3-4d8f-9821-e30100e3eea9">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_cc436b84-88d3-4d8f-9821-e30100e3eea9_0_">
                      <gml:posList srsDimension="3">93372.254 437088.3 2.77000000000002 93366.729 437086.948 2.77000000000002 93366.729 437086.948 18.1622499672188 93372.254 437088.3 18.1622499672188 93372.254 437088.3 2.77000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3a40634f-2713-4e78-a7b7-62b114433b75">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3a40634f-2713-4e78-a7b7-62b114433b75_0_">
                      <gml:posList srsDimension="3">93372.359 437065.78 18.1622499672188 93366.729 437086.948 18.1622499672188 93366.729 437086.948 2.77000000000002 93372.359 437065.78 2.77000000000002 93372.359 437065.78 18.1622499672188</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c478bbc4-072a-48ec-bcab-c8f0d8c65d45">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c478bbc4-072a-48ec-bcab-c8f0d8c65d45_0_">
                      <gml:posList srsDimension="3">93372.42 437065.8 18.1622499672188 93372.359 437065.78 18.1622499672188 93372.359 437065.78 2.77000000000002 93372.42 437065.8 2.77000000000002 93372.42 437065.8 18.1622499672188</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_01c1da40-86a1-4545-b580-b742c320c304">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_01c1da40-86a1-4545-b580-b742c320c304_0_">
                      <gml:posList srsDimension="3">93377.663 437067.502 18.1622499672188 93372.42 437065.8 18.1622499672188 93372.42 437065.8 2.77000000000002 93377.663 437067.502 2.77000000000002 93377.663 437067.502 18.1622499672188</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3223600d-0dd5-4075-967e-bc2e828a5ae2">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3223600d-0dd5-4075-967e-bc2e828a5ae2_0_">
                      <gml:posList srsDimension="3">93377.663 437067.502 2.77000000000002 93372.254 437088.3 2.77000000000002 93372.254 437088.3 18.1622499672188 93377.663 437067.502 18.1622499672188 93377.663 437067.502 2.77000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_167dc085-1b34-4fd9-98a1-322d2b4cfd00">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_167dc085-1b34-4fd9-98a1-322d2b4cfd00_0_">
                      <gml:posList srsDimension="3">93372.42 437065.8 18.1622499672188 93377.663 437067.502 18.1622499672188 93372.254 437088.3 18.1622499672188 93366.729 437086.948 18.1622499672188 93372.359 437065.78 18.1622499672188 93372.42 437065.8 18.1622499672188</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_da4a91e6-12b4-48c7-9dce-2f4c551c68f4">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_da4a91e6-12b4-48c7-9dce-2f4c551c68f4_0_">
                      <gml:posList srsDimension="3">93372.42 437065.8 2.77000000000002 93372.359 437065.78 2.77000000000002 93366.729 437086.948 2.77000000000002 93372.254 437088.3 2.77000000000002 93377.663 437067.502 2.77000000000002 93372.42 437065.8 2.77000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod1Solid>
      <bldg:lod2Solid>
        <gml:Solid gml:id="UUID_b54dd446-3502-43ac-ab08-b103426362e9">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_6c0d099f-8f4c-48cc-93bd-8dfe967ab3f5">
              <gml:surfaceMember xlink:href="#RCID_1fa0f03c-1bba-4cda-b578-ba52f4d83ab1"/>
              <gml:surfaceMember xlink:href="#RCID_bb06234f-5e8d-4f48-b8cc-fad2aca8f70d"/>
              <gml:surfaceMember xlink:href="#RCID_a41dd33b-076a-476a-bc6a-c8a2c83a412d"/>
              <gml:surfaceMember xlink:href="#RCID_59a7a692-0f35-4a15-ae76-91f89e2f4d1a"/>
              <gml:surfaceMember xlink:href="#RCID_cdb274bb-d244-4aa6-9552-a696fff7b3cc"/>
              <gml:surfaceMember xlink:href="#RCID_c5a8e0f0-d71e-4c7f-94b5-1fb7b7dd5197"/>
              <gml:surfaceMember xlink:href="#RCID_e54d080a-2cf8-4175-b0ae-530fdafaa8a4"/>
              <gml:surfaceMember xlink:href="#RCID_d3c66402-c338-4d9f-8aa3-e453cba2cf90"/>
              <gml:surfaceMember xlink:href="#RCID_d8ead377-b38f-4fef-948b-e1e4246b8998"/>
              <gml:surfaceMember xlink:href="#RCID_fcb16800-9205-42cb-8bcd-136ae9997760"/>
              <gml:surfaceMember xlink:href="#RCID_b2b84c51-b272-4e52-9b97-e63f8520a912"/>
              <gml:surfaceMember xlink:href="#RCID_bf3d4141-4a18-4dcd-a0eb-104204f6219c"/>
              <gml:surfaceMember xlink:href="#RCID_5c1c8ddc-0713-4a9f-9bf1-c589a6c3f29b"/>
              <gml:surfaceMember xlink:href="#RCID_1cf83e15-f880-46a4-ac26-8c01af730b52"/>
              <gml:surfaceMember xlink:href="#RCID_24e67e6b-6d40-4ec3-bac3-adc11c469c14"/>
              <gml:surfaceMember xlink:href="#RCID_88ce5c7a-eeb2-468d-9c1c-8541c80284cb"/>
              <gml:surfaceMember xlink:href="#RCID_a558f927-d5a3-4735-8c2c-b0312695c447"/>
              <gml:surfaceMember xlink:href="#RCID_74ab01a4-0ebb-47da-ba55-250394004c2f"/>
              <gml:surfaceMember xlink:href="#RCID_f94bf9b3-95a9-4d9c-815c-1ef464ebaff1"/>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod2Solid>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_be507efb-b978-4657-b03a-fec4b210de0a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_7cbfc51d-7ab5-437a-a379-121d15d18173">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_88ce5c7a-eeb2-468d-9c1c-8541c80284cb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_88ce5c7a-eeb2-468d-9c1c-8541c80284cb_0_">
                      <gml:posList srsDimension="3">93372.42 437065.8 14.9091249672189 93372.359 437065.78 14.9091249672189 93372.359 437065.78 2.77000000000002 93372.42 437065.8 2.77000000000002 93372.42 437065.8 14.9091249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a558f927-d5a3-4735-8c2c-b0312695c447">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a558f927-d5a3-4735-8c2c-b0312695c447_0_">
                      <gml:posList srsDimension="3">93377.663 437067.502 14.9091249672189 93372.42 437065.8 14.9091249672189 93372.42 437065.8 2.77000000000002 93377.663 437067.502 2.77000000000002 93377.663 437067.502 14.9091249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_d832caef-557b-4f6d-bd4c-eaa89a89851d">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2b4a9e1f-0ed3-4f5a-a6f5-2cf0bf875559">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_bb06234f-5e8d-4f48-b8cc-fad2aca8f70d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_bb06234f-5e8d-4f48-b8cc-fad2aca8f70d_0_">
                      <gml:posList srsDimension="3">93375.1124212228 437072.911026434 17.7403749672189 93372.5518100236 437072.371827254 17.7403749672189 93373.3982681919 437068.042257102 17.7403749672189 93375.903078499 437068.925385405 17.7403749672189 93375.1124212228 437072.911026434 17.7403749672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_d51ae442-76ba-4026-a089-71eabff3e967">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_4099037e-087d-4c57-be97-e98a36c318c0">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_cdb274bb-d244-4aa6-9552-a696fff7b3cc">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_cdb274bb-d244-4aa6-9552-a696fff7b3cc_0_">
                      <gml:posList srsDimension="3">93377.663 437067.502 14.9091249672189 93376.1968683543 437073.139383244 14.9091249672189 93375.903078499 437068.925385405 17.7403749672189 93377.663 437067.502 14.9091249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c5a8e0f0-d71e-4c7f-94b5-1fb7b7dd5197">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c5a8e0f0-d71e-4c7f-94b5-1fb7b7dd5197_0_">
                      <gml:posList srsDimension="3">93376.1968683543 437073.139383244 14.9091249672189 93375.1124212228 437072.911026434 17.7403749672189 93375.903078499 437068.925385405 17.7403749672189 93376.1968683543 437073.139383244 14.9091249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:GroundSurface gml:id="UUID_0770ac7e-c514-4aee-a087-ef659d889300">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_66c99e94-03b1-4490-8a1c-e4f22583dcc0">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1fa0f03c-1bba-4cda-b578-ba52f4d83ab1">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1fa0f03c-1bba-4cda-b578-ba52f4d83ab1_0_">
                      <gml:posList srsDimension="3">93372.42 437065.8 2.77000000000002 93372.359 437065.78 2.77000000000002 93366.729 437086.948 2.77000000000002 93372.254 437088.3 2.77000000000002 93377.663 437067.502 2.77000000000002 93372.42 437065.8 2.77000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:GroundSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_8ddf8684-b06b-4d63-9f85-bbc361892f4d">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_19018c78-c802-44bd-9622-961d6261a95a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_74ab01a4-0ebb-47da-ba55-250394004c2f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_74ab01a4-0ebb-47da-ba55-250394004c2f_0_">
                      <gml:posList srsDimension="3">93370.7089967037 437071.983777936 14.9091249672189 93370.7089967037 437071.983777936 18.1622499672188 93367.1538880886 437085.350481162 18.1622499672188 93366.729 437086.948 14.3184999672188 93366.729 437086.948 2.77000000000002 93372.359 437065.78 2.77000000000002 93372.359 437065.78 14.9091249672189 93370.7089967037 437071.983777936 14.9091249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_5fb4ee46-0447-4ae7-9ed5-b6e3b520ccce">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_48e5e173-99fa-444a-8dbd-5a6d625a0786">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_59a7a692-0f35-4a15-ae76-91f89e2f4d1a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_59a7a692-0f35-4a15-ae76-91f89e2f4d1a_0_">
                      <gml:posList srsDimension="3">93372.254 437088.3 14.3184999672188 93366.729 437086.948 14.3184999672188 93367.1538880886 437085.350481162 18.1622499672188 93372.6725004244 437086.690835307 18.1622499672188 93372.254 437088.3 14.3184999672188</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_1bd074b3-ccf7-4eb8-87c2-6c8e25b872c7">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_1d7cc3b8-c76c-45ca-8cc8-584ec06bac59">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_fcb16800-9205-42cb-8bcd-136ae9997760">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_fcb16800-9205-42cb-8bcd-136ae9997760_0_">
                      <gml:posList srsDimension="3">93373.3982681919 437068.042257102 17.7403749672189 93370.7089967037 437071.983777936 14.9091249672189 93372.359 437065.78 14.9091249672189 93373.3982681919 437068.042257102 17.7403749672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b2b84c51-b272-4e52-9b97-e63f8520a912">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b2b84c51-b272-4e52-9b97-e63f8520a912_0_">
                      <gml:posList srsDimension="3">93373.3982681919 437068.042257102 17.7403749672189 93372.5518100237 437072.371827254 17.7403749672189 93370.7089967037 437071.983777936 14.9091249672189 93373.3982681919 437068.042257102 17.7403749672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_f4f51019-672d-44d4-8e26-bf6d1709f11a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_90abc93b-922a-4437-b4aa-19f55e2b00c1">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f94bf9b3-95a9-4d9c-815c-1ef464ebaff1">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f94bf9b3-95a9-4d9c-815c-1ef464ebaff1_0_">
                      <gml:posList srsDimension="3">93372.254 437088.3 2.77000000000002 93366.729 437086.948 2.77000000000002 93366.729 437086.948 14.3184999672188 93372.254 437088.3 14.3184999672188 93372.254 437088.3 2.77000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_4af26cf9-920c-4791-bf31-369ac41f7fc9">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_3a4114ab-27e6-44fb-9603-ef4fd48d08cf">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a41dd33b-076a-476a-bc6a-c8a2c83a412d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a41dd33b-076a-476a-bc6a-c8a2c83a412d_0_">
                      <gml:posList srsDimension="3">93376.1968683543 437073.139383244 18.1622499672188 93372.6725004244 437086.690835307 18.1622499672188 93367.1538880886 437085.350481162 18.1622499672188 93370.7089967037 437071.983777936 18.1622499672188 93372.5518100237 437072.371827254 18.1622499672188 93375.1124212228 437072.911026434 18.1622499672188 93376.1968683543 437073.139383244 18.1622499672188</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_cf8b77b6-d54e-4560-a103-0a09ea904ff6">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_152b24b2-2724-488b-9dc5-d34c87a440d7">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e54d080a-2cf8-4175-b0ae-530fdafaa8a4">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e54d080a-2cf8-4175-b0ae-530fdafaa8a4_0_">
                      <gml:posList srsDimension="3">93377.663 437067.502 14.9091249672189 93375.903078499 437068.925385405 17.7403749672189 93373.3982681919 437068.042257102 17.7403749672189 93377.663 437067.502 14.9091249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d3c66402-c338-4d9f-8aa3-e453cba2cf90">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d3c66402-c338-4d9f-8aa3-e453cba2cf90_0_">
                      <gml:posList srsDimension="3">93377.663 437067.502 14.9091249672189 93373.3982681919 437068.042257102 17.7403749672189 93372.42 437065.8 14.9091249672189 93377.663 437067.502 14.9091249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d8ead377-b38f-4fef-948b-e1e4246b8998">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d8ead377-b38f-4fef-948b-e1e4246b8998_0_">
                      <gml:posList srsDimension="3">93373.3982681919 437068.042257102 17.7403749672189 93372.359 437065.78 14.9091249672189 93372.42 437065.8 14.9091249672189 93373.3982681919 437068.042257102 17.7403749672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_36b012b5-1adf-47c6-91fc-77acafbd6e17">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_f58c4225-5024-45f4-ae41-84c41fd2da19">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_bf3d4141-4a18-4dcd-a0eb-104204f6219c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_bf3d4141-4a18-4dcd-a0eb-104204f6219c_0_">
                      <gml:posList srsDimension="3">93372.5518100237 437072.371827254 18.1622499672188 93370.7089967037 437071.983777936 18.1622499672188 93370.7089967037 437071.983777936 14.9091249672189 93372.5518100237 437072.371827254 17.7403749672189 93372.5518100237 437072.371827254 18.1622499672188</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5c1c8ddc-0713-4a9f-9bf1-c589a6c3f29b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5c1c8ddc-0713-4a9f-9bf1-c589a6c3f29b_0_">
                      <gml:posList srsDimension="3">93376.1968683543 437073.139383244 18.1622499672188 93375.1124212228 437072.911026434 18.1622499672188 93375.1124212228 437072.911026434 17.7403749672189 93376.1968683543 437073.139383244 14.9091249672189 93376.1968683543 437073.139383244 18.1622499672188</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1cf83e15-f880-46a4-ac26-8c01af730b52">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1cf83e15-f880-46a4-ac26-8c01af730b52_0_">
                      <gml:posList srsDimension="3">93375.1124212228 437072.911026434 18.1622499672188 93372.5518100237 437072.371827254 18.1622499672188 93372.5518100237 437072.371827254 17.7403749672189 93375.1124212228 437072.911026434 17.7403749672189 93375.1124212228 437072.911026434 18.1622499672188</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_c5a3aa8d-ba81-4397-9efa-5d0fd63fa705">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_6690177b-8e8b-4b4a-9d3c-d3bbe1ecaa3f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_24e67e6b-6d40-4ec3-bac3-adc11c469c14">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_24e67e6b-6d40-4ec3-bac3-adc11c469c14_0_">
                      <gml:posList srsDimension="3">93376.1968683543 437073.139383244 14.9091249672189 93377.663 437067.502 14.9091249672189 93377.663 437067.502 2.77000000000002 93372.254 437088.3 2.77000000000002 93372.254 437088.3 14.3184999672188 93372.6725004244 437086.690835307 18.1622499672188 93376.1968683543 437073.139383244 18.1622499672188 93376.1968683543 437073.139383244 14.9091249672189</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:AddressDetails>
              <xAL:Country>
                <xAL:CountryName>Nederland</xAL:CountryName>
                <xAL:Locality Type="Town">
                  <xAL:LocalityName>Rotterdam</xAL:LocalityName>
                  <xAL:Thoroughfare Type="Street">
                    <xAL:ThoroughfareNumber>12-8</xAL:ThoroughfareNumber>
                    <xAL:ThoroughfareName>Oost-Wijnstraat</xAL:ThoroughfareName>
                  </xAL:Thoroughfare>
                  <xAL:PostalCode>
                    <xAL:PostalCodeNumber>3011TZ</xAL:PostalCodeNumber>
                  </xAL:PostalCode>
                </xAL:Locality>
              </xAL:Country>
            </xAL:AddressDetails>
          </xalAddress>
          <multiPoint>
            <gml:MultiPoint>
              <gml:pointMember>
                <gml:Point>
                  <gml:pos srsDimension="3">93370.5026666667 437072.842666667 2.77947000000403</gml:pos>
                </gml:Point>
              </gml:pointMember>
            </gml:MultiPoint>
          </multiPoint>
        </Address>
      </bldg:address>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:AddressDetails>
              <xAL:Country>
                <xAL:CountryName>Nederland</xAL:CountryName>
                <xAL:Locality Type="Town">
                  <xAL:LocalityName>Rotterdam</xAL:LocalityName>
                  <xAL:Thoroughfare Type="Street">
                    <xAL:ThoroughfareNumber>11</xAL:ThoroughfareNumber>
                    <xAL:ThoroughfareName>Wijnhaven</xAL:ThoroughfareName>
                  </xAL:Thoroughfare>
                  <xAL:PostalCode>
                    <xAL:PostalCodeNumber>3011TZ</xAL:PostalCodeNumber>
                  </xAL:PostalCode>
                </xAL:Locality>
              </xAL:Country>
            </xAL:AddressDetails>
          </xalAddress>
          <multiPoint>
            <gml:MultiPoint>
              <gml:pointMember>
                <gml:Point>
                  <gml:pos srsDimension="3">93370.5026666667 437072.842666667 2.77947000000403</gml:pos>
                </gml:Point>
              </gml:pointMember>
            </gml:MultiPoint>
          </multiPoint>
        </Address>
      </bldg:address>
    </bldg:Building>
  </cityObjectMember>
  <cityObjectMember>
    <bldg:Building gml:id="ID_0599100010028366">
      <gml:boundedBy>
        <gml:Envelope srsName="urn:ogc:def:crs:EPSG::28992" srsDimension="3">
          <gml:lowerCorner>93358.14 437015.46 1.4759999999924</gml:lowerCorner>
          <gml:upperCorner>93365.59 437022.72 14.0387010049877</gml:upperCorner>
        </gml:Envelope>
      </gml:boundedBy>
      <creationDate>2019-06-11</creationDate>
      <gen:stringAttribute name="statusOmschr">
        <gen:value>Pand in gebruik</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="gebouwnummer">
        <gen:value>0599100010028366</gen:value>
      </gen:stringAttribute>
      <gen:intAttribute name="aantalBouwlagen">
        <gen:value>1</gen:value>
      </gen:intAttribute>
      <app:appearance>
        <app:Appearance gml:id="UUID_a3717371-403e-4bcf-ad08-2f4b9684a063">
          <app:theme>RhinoCity texturing</app:theme>
          <app:surfaceDataMember>
            <app:ParameterizedTexture gml:id="UUID_6fa8a1d1-2009-4ecc-8ff6-2938ea14e334">
              <app:imageURI>appearance/tex_2.jpg</app:imageURI>
              <app:textureType>specific</app:textureType>
              <app:wrapMode>border</app:wrapMode>
              <app:borderColor>0.0 0.0 0.0 1.0</app:borderColor>
              <app:target uri="#RCID_4b5d6479-239f-4e53-8c6b-d99a448d9164">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_4b5d6479-239f-4e53-8c6b-d99a448d9164_0_">0.003922 0.919544 0.052893 0.848664 0.111605 0.827451 0.189968 0.855271 0.209598 0.908378 0.165158 0.977616 0.101454 0.997387 0.022327 0.967209 0.003922 0.919544</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_26084f41-309c-435e-b45d-7ba54559f4cb">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_26084f41-309c-435e-b45d-7ba54559f4cb_0_">0.091848 0.021519 0.192496 0.003922 0.405415 0.064856 0.246482 0.318402 0.052445 0.231412 0.003922 0.167166 0.091848 0.021519</app:textureCoordinates>
                  <app:textureCoordinates ring="#RCID_26084f41-309c-435e-b45d-7ba54559f4cb_1_">0.075696 0.185482 0.155227 0.215934 0.219235 0.195985 0.263863 0.126121 0.244113 0.072534 0.165352 0.044461 0.10636 0.065865 0.057179 0.137385 0.075696 0.185482</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2410c03e-b96c-4fb1-8065-8299225daac1">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2410c03e-b96c-4fb1-8065-8299225daac1_0_">0.386046 0.604266 0.44605 0.584314 0.436714 0.788498 0.376471 0.808472 0.386046 0.604266</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c07b0d3e-335a-43f7-98a4-e911fafac603">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c07b0d3e-335a-43f7-98a4-e911fafac603_0_">0.160784 0.584314 0.237567 0.612259 0.267877 0.815028 0.190789 0.78705 0.160784 0.584314</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_55eda2de-5d55-48a3-886b-edfdda7855a5">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_55eda2de-5d55-48a3-886b-edfdda7855a5_0_">0.278431 0.605615 0.335514 0.584314 0.365296 0.786992 0.307968 0.808319 0.278431 0.605615</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_852ab737-78c3-498b-ad9b-800905ca9bc8">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_852ab737-78c3-498b-ad9b-800905ca9bc8_0_">0.478431 0.329412 0.547368 0.356888 0.601276 0.564832 0.532109 0.537347 0.478431 0.329412</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_96f7d2a3-f381-46c9-b83f-c8444709a8d1">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_96f7d2a3-f381-46c9-b83f-c8444709a8d1_0_">0.695945 0.792014 0.641469 0.807302 0.588235 0.599596 0.642498 0.584314 0.695945 0.792014</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_0ddaaa83-0040-4c54-aaa7-1553fe0d3e86">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_0ddaaa83-0040-4c54-aaa7-1553fe0d3e86_0_">0.090429 0.818579 0.003922 0.789496 0.065228 0.584314 0.151364 0.613368 0.090429 0.818579</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_aa42d875-0abb-4f26-9e9d-e7a50ba71cab">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_aa42d875-0abb-4f26-9e9d-e7a50ba71cab_0_">0.772214 0.788455 0.727636 0.79879 0.705882 0.59466 0.750323 0.584314 0.772214 0.788455</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_7f0d5c59-c111-4b30-85da-725dbca0198b">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_7f0d5c59-c111-4b30-85da-725dbca0198b_0_">0.696619 0.563309 0.611765 0.536044 0.665614 0.329412 0.750119 0.356658 0.696619 0.563309</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_6b14b70e-9ba3-4fc2-81c1-ef8d375a3fe2">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_6b14b70e-9ba3-4fc2-81c1-ef8d375a3fe2_0_">0.760784 0.329412 0.904093 0.37743 0.953162 0.56392 0.809445 0.515998 0.760784 0.329412</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_0a0935fc-eb27-43c4-9ea8-17053fa3218d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_0a0935fc-eb27-43c4-9ea8-17053fa3218d_0_">0.579291 0.770739 0.502761 0.806779 0.454902 0.620303 0.531161 0.584314 0.579291 0.770739</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_50069267-7891-40a6-98d9-72262da7dfe6">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_50069267-7891-40a6-98d9-72262da7dfe6_0_">0.182862 0.57579 0.003922 0.517775 0.043323 0.329412 0.221677 0.387484 0.182862 0.57579</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_b14e491e-5573-448a-a7be-4cde9d15b4b3">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_b14e491e-5573-448a-a7be-4cde9d15b4b3_0_">0.727238 0.286856 0.415686 0.18969 0.465175 0.003922 0.775623 0.10083 0.727238 0.286856</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_777fe397-d244-4cb6-a04f-e789cca758f6">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_777fe397-d244-4cb6-a04f-e789cca758f6_0_">0.231373 0.329412 0.442129 0.39004 0.470408 0.571913 0.25889 0.511205 0.231373 0.329412</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_07528714-350b-41fe-bf46-449a4d9af913">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_07528714-350b-41fe-bf46-449a4d9af913_0_">0.780392 0.601741 0.878569 0.584314 0.90569 0.765487 0.807145 0.782959 0.780392 0.601741</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
            </app:ParameterizedTexture>
          </app:surfaceDataMember>
        </app:Appearance>
      </app:appearance>
      <bldg:yearOfConstruction>1953</bldg:yearOfConstruction>
      <bldg:lod1Solid>
        <gml:Solid gml:id="ID_dd9eb0a9-bc2a-4d48-9566-4a3f75bbad6a">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_c48ed733-91e2-40ab-9d19-ac332d0f9696">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_fbfe4e85-e099-439b-b92c-e12e3356ef2f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_fbfe4e85-e099-439b-b92c-e12e3356ef2f_0_">
                      <gml:posList srsDimension="3">93364.18 437022.33 1.4759999999924 93362.3 437022.72 1.4759999999924 93362.3 437022.72 7.44126810161443 93364.18 437022.33 7.44126810161443 93364.18 437022.33 1.4759999999924</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b3054071-d0e2-415a-ac43-210d6ac9ab1a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b3054071-d0e2-415a-ac43-210d6ac9ab1a_0_">
                      <gml:posList srsDimension="3">93362.3 437022.72 1.4759999999924 93358.14 437021.29 1.4759999999924 93358.14 437021.29 7.44126810161443 93362.3 437022.72 7.44126810161443 93362.3 437022.72 1.4759999999924</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_fd83ada8-5409-4c66-90f3-551017e2a150">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_fd83ada8-5409-4c66-90f3-551017e2a150_0_">
                      <gml:posList srsDimension="3">93360.69 437015.46 7.44126810161443 93358.14 437021.29 7.44126810161443 93358.14 437021.29 1.4759999999924 93360.69 437015.46 1.4759999999924 93360.69 437015.46 7.44126810161443</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_57a7cfcb-8b0c-4c34-80a8-ef459edbde40">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_57a7cfcb-8b0c-4c34-80a8-ef459edbde40_0_">
                      <gml:posList srsDimension="3">93364.55 437017.5 7.44126810161443 93360.69 437015.46 7.44126810161443 93360.69 437015.46 1.4759999999924 93364.55 437017.5 1.4759999999924 93364.55 437017.5 7.44126810161443</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e45783ed-1bd4-43bf-93f5-0afc5ce652be">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e45783ed-1bd4-43bf-93f5-0afc5ce652be_0_">
                      <gml:posList srsDimension="3">93365.59 437018.99 7.44126810161443 93364.55 437017.5 7.44126810161443 93364.55 437017.5 1.4759999999924 93365.59 437018.99 1.4759999999924 93365.59 437018.99 7.44126810161443</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c5b2dabd-a928-4cf6-998b-8580f8b5174a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c5b2dabd-a928-4cf6-998b-8580f8b5174a_0_">
                      <gml:posList srsDimension="3">93365.59 437018.99 1.4759999999924 93364.18 437022.33 1.4759999999924 93364.18 437022.33 7.44126810161443 93365.59 437018.99 7.44126810161443 93365.59 437018.99 1.4759999999924</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ed7d1872-8ac7-4047-9eca-6b2ace425a6a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ed7d1872-8ac7-4047-9eca-6b2ace425a6a_0_">
                      <gml:posList srsDimension="3">93364.18 437022.33 7.44126810161443 93362.3 437022.72 7.44126810161443 93358.14 437021.29 7.44126810161443 93360.69 437015.46 7.44126810161443 93364.55 437017.5 7.44126810161443 93365.59 437018.99 7.44126810161443 93364.18 437022.33 7.44126810161443</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3a39455e-eaf8-4f1c-aac8-7072de9b1f81">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3a39455e-eaf8-4f1c-aac8-7072de9b1f81_0_">
                      <gml:posList srsDimension="3">93365.59 437018.99 1.4759999999924 93364.55 437017.5 1.4759999999924 93360.69 437015.46 1.4759999999924 93358.14 437021.29 1.4759999999924 93362.3 437022.72 1.4759999999924 93364.18 437022.33 1.4759999999924 93365.59 437018.99 1.4759999999924</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod1Solid>
      <bldg:lod2Solid>
        <gml:Solid gml:id="UUID_0d2bef9f-7bfa-4f41-b9e6-761c285fecd8">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_62bde739-6c24-44ef-ba07-1130fd79c6df">
              <gml:surfaceMember xlink:href="#RCID_5ca18d34-f75b-438e-b8db-0a469bd15d31"/>
              <gml:surfaceMember xlink:href="#RCID_4b5d6479-239f-4e53-8c6b-d99a448d9164"/>
              <gml:surfaceMember xlink:href="#RCID_26084f41-309c-435e-b45d-7ba54559f4cb"/>
              <gml:surfaceMember xlink:href="#RCID_2410c03e-b96c-4fb1-8065-8299225daac1"/>
              <gml:surfaceMember xlink:href="#RCID_c07b0d3e-335a-43f7-98a4-e911fafac603"/>
              <gml:surfaceMember xlink:href="#RCID_55eda2de-5d55-48a3-886b-edfdda7855a5"/>
              <gml:surfaceMember xlink:href="#RCID_852ab737-78c3-498b-ad9b-800905ca9bc8"/>
              <gml:surfaceMember xlink:href="#RCID_96f7d2a3-f381-46c9-b83f-c8444709a8d1"/>
              <gml:surfaceMember xlink:href="#RCID_0ddaaa83-0040-4c54-aaa7-1553fe0d3e86"/>
              <gml:surfaceMember xlink:href="#RCID_aa42d875-0abb-4f26-9e9d-e7a50ba71cab"/>
              <gml:surfaceMember xlink:href="#RCID_7f0d5c59-c111-4b30-85da-725dbca0198b"/>
              <gml:surfaceMember xlink:href="#RCID_6b14b70e-9ba3-4fc2-81c1-ef8d375a3fe2"/>
              <gml:surfaceMember xlink:href="#RCID_0a0935fc-eb27-43c4-9ea8-17053fa3218d"/>
              <gml:surfaceMember xlink:href="#RCID_50069267-7891-40a6-98d9-72262da7dfe6"/>
              <gml:surfaceMember xlink:href="#RCID_b14e491e-5573-448a-a7be-4cde9d15b4b3"/>
              <gml:surfaceMember xlink:href="#RCID_777fe397-d244-4cb6-a04f-e789cca758f6"/>
              <gml:surfaceMember xlink:href="#RCID_07528714-350b-41fe-bf46-449a4d9af913"/>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod2Solid>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_40426260-fff1-49ea-bdcf-267d955ccb91">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_355e4e7c-f20c-4f8e-b133-6df0f73a7dfd">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_50069267-7891-40a6-98d9-72262da7dfe6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_50069267-7891-40a6-98d9-72262da7dfe6_0_">
                      <gml:posList srsDimension="3">93364.55 437017.5 7.44346120490402 93360.69 437015.46 7.44461446471703 93360.69 437015.46 1.4759999999924 93364.55 437017.5 1.4759999999924 93364.55 437017.5 7.44346120490402</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_bc4dfaeb-a1d7-4341-b6f1-3a92d52b5970">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_b510633f-79a9-477e-b076-80333dccb5f7">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0a0935fc-eb27-43c4-9ea8-17053fa3218d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0a0935fc-eb27-43c4-9ea8-17053fa3218d_0_">
                      <gml:posList srsDimension="3">93365.59 437018.99 7.44223908472598 93364.55 437017.5 7.44346120490402 93364.55 437017.5 1.4759999999924 93365.59 437018.99 1.4759999999924 93365.59 437018.99 7.44223908472598</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_08094a24-cbd3-4bce-92b7-1dcaf2522355">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_5ba85b1f-8741-4c90-a1f4-0b767bef6ebd">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6b14b70e-9ba3-4fc2-81c1-ef8d375a3fe2">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6b14b70e-9ba3-4fc2-81c1-ef8d375a3fe2_0_">
                      <gml:posList srsDimension="3">93365.59 437018.99 1.4759999999924 93364.18 437022.33 1.4759999999924 93364.18 437022.33 7.43870100498767 93365.59 437018.99 7.44223908472598 93365.59 437018.99 1.4759999999924</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_953b491f-0e19-477f-b091-605eb237161d">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_baf6577a-4408-4548-b76e-c1757a8cae0c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7f0d5c59-c111-4b30-85da-725dbca0198b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7f0d5c59-c111-4b30-85da-725dbca0198b_0_">
                      <gml:posList srsDimension="3">93361.4365945166 437018.292010759 14.0387010049877 93360.7169660409 437019.898132344 14.0387010049877 93360.7169660409 437019.898132344 7.43819857566583 93361.4365945166 437018.292010759 7.43819857566583 93361.4365945166 437018.292010759 14.0387010049877</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d31838e6-0c60-443d-893c-08b54e6115e8">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c80d3d78-ad79-437d-a931-a62e4c9021ff">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b14e491e-5573-448a-a7be-4cde9d15b4b3">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b14e491e-5573-448a-a7be-4cde9d15b4b3_0_">
                      <gml:posList srsDimension="3">93360.69 437015.46 7.44461446471703 93358.14 437021.29 7.43841975380501 93358.14 437021.29 1.4759999999924 93360.69 437015.46 1.4759999999924 93360.69 437015.46 7.44461446471703</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d3b98521-755a-4087-922a-6c7055ecf87f">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_0d42ab23-525d-4771-a4c2-bb159fc4e954">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0ddaaa83-0040-4c54-aaa7-1553fe0d3e86">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0ddaaa83-0040-4c54-aaa7-1553fe0d3e86_0_">
                      <gml:posList srsDimension="3">93364.1896555663 437018.554389766 14.0387010049877 93362.6190765406 437017.839900176 14.0387010049877 93362.6190765406 437017.839900176 7.43819857566583 93364.1896555663 437018.554389766 7.43819857566583 93364.1896555663 437018.554389766 14.0387010049877</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_fb6a6eba-8598-4fac-aaf9-9f2853f296c5">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e809d4ed-d037-4857-b7e1-4998d757c0cd">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_96f7d2a3-f381-46c9-b83f-c8444709a8d1">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_96f7d2a3-f381-46c9-b83f-c8444709a8d1_0_">
                      <gml:posList srsDimension="3">93364.6293607551 437019.666862632 14.0387010049877 93364.1896555663 437018.554389766 14.0387010049877 93364.1896555663 437018.554389766 7.43819857566583 93364.6293607551 437019.666862632 7.43819857566583 93364.6293607551 437019.666862632 14.0387010049877</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_01ec0bcb-1f53-4c5e-a421-1b0a4addd6ca">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_b67df4d1-e10d-4c84-bacf-355529c16147">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_852ab737-78c3-498b-ad9b-800905ca9bc8">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_852ab737-78c3-498b-ad9b-800905ca9bc8_0_">
                      <gml:posList srsDimension="3">93364.6293607551 437019.666862632 7.43819857566583 93363.823608256 437021.307718373 7.43819857566583 93363.823608256 437021.307718373 14.0387010049877 93364.6293607551 437019.666862632 14.0387010049877 93364.6293607551 437019.666862632 7.43819857566583</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_2fd1f81c-dd1c-4256-9f08-0a28cc2a9b0f">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2e9fe683-1c8a-48e9-9253-de659e87e61f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_55eda2de-5d55-48a3-886b-edfdda7855a5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_55eda2de-5d55-48a3-886b-edfdda7855a5_0_">
                      <gml:posList srsDimension="3">93363.823608256 437021.307718373 7.43819857566583 93362.7413426333 437021.792053252 7.43819857566583 93362.7413426333 437021.792053252 14.0387010049877 93363.823608256 437021.307718373 14.0387010049877 93363.823608256 437021.307718373 7.43819857566583</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_fc96cad8-cbc4-45dc-a680-f6914017f01f">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_76364064-d366-4eaf-98d6-69cc4bdfb5c0">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c07b0d3e-335a-43f7-98a4-e911fafac603">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c07b0d3e-335a-43f7-98a4-e911fafac603_0_">
                      <gml:posList srsDimension="3">93362.7413426333 437021.792053252 7.43819857566583 93361.1923360535 437021.135307867 7.43819857566583 93361.1923360535 437021.135307867 14.0387010049877 93362.7413426333 437021.792053252 14.0387010049877 93362.7413426333 437021.792053252 7.43819857566583</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d13fe82b-0f06-402e-b8af-4225cc0e8f56">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_6844a4ae-402c-41f5-9fe2-b1040aa76398">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2410c03e-b96c-4fb1-8065-8299225daac1">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2410c03e-b96c-4fb1-8065-8299225daac1_0_">
                      <gml:posList srsDimension="3">93361.1923360535 437021.135307867 7.43819857566583 93360.7169660409 437019.898132344 7.43819857566583 93360.7169660409 437019.898132344 14.0387010049877 93361.1923360535 437021.135307867 14.0387010049877 93361.1923360535 437021.135307867 7.43819857566583</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_3b138984-1071-4c21-8b4e-354425387aa6">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_58e8e560-ec62-44e9-9ca7-c22313434f03">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_26084f41-309c-435e-b45d-7ba54559f4cb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_26084f41-309c-435e-b45d-7ba54559f4cb_0_">
                      <gml:posList srsDimension="3">93364.18 437022.33 7.43870100498767 93362.3 437022.72 7.43792173851184 93358.14 437021.29 7.43841975380501 93360.69 437015.46 7.44461446471703 93364.55 437017.5 7.44346120490402 93365.59 437018.99 7.44223908472598 93364.18 437022.33 7.43870100498767</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                  <gml:interior>
                    <gml:LinearRing gml:id="RCID_26084f41-309c-435e-b45d-7ba54559f4cb_1_">
                      <gml:posList srsDimension="3">93364.1896555663 437018.554389766 7.43819857566583 93362.6190765406 437017.839900176 7.43819857566583 93361.4365945165 437018.292010759 7.43819857566583 93360.7169660409 437019.898132344 7.43819857566583 93361.1923360535 437021.135307867 7.43819857566583 93362.7413426333 437021.792053252 7.43819857566583 93363.823608256 437021.307718373 7.43819857566583 93364.6293607551 437019.666862632 7.43819857566583 93364.1896555663 437018.554389766 7.43819857566583</gml:posList>
                    </gml:LinearRing>
                  </gml:interior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_a27d9dc6-5efa-4a84-b731-99f717b692aa">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_ec517cc3-f0e2-4d2e-a30a-3b985bb2bb2d">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4b5d6479-239f-4e53-8c6b-d99a448d9164">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4b5d6479-239f-4e53-8c6b-d99a448d9164_0_">
                      <gml:posList srsDimension="3">93364.6293607551 437019.666862632 14.0387010049877 93363.823608256 437021.307718373 14.0387010049877 93362.7413426333 437021.792053252 14.0387010049877 93361.1923360535 437021.135307867 14.0387010049877 93360.7169660409 437019.898132344 14.0387010049877 93361.4365945165 437018.292010759 14.0387010049877 93362.6190765406 437017.839900176 14.0387010049877 93364.1896555663 437018.554389766 14.0387010049877 93364.6293607551 437019.666862632 14.0387010049877</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:GroundSurface gml:id="UUID_5fb779aa-9198-4892-b888-499f1171b110">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_578b9bb8-b08b-4e4b-a8f1-e58e1882454d">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5ca18d34-f75b-438e-b8db-0a469bd15d31">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5ca18d34-f75b-438e-b8db-0a469bd15d31_0_">
                      <gml:posList srsDimension="3">93365.59 437018.99 1.4759999999924 93364.55 437017.5 1.4759999999924 93360.69 437015.46 1.4759999999924 93358.14 437021.29 1.4759999999924 93362.3 437022.72 1.4759999999924 93364.18 437022.33 1.4759999999924 93365.59 437018.99 1.4759999999924</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:GroundSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_803521c8-7f9e-4100-b0c0-b7b854891f35">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_871048ad-f5ad-48a3-abb3-f0ecba86078a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_777fe397-d244-4cb6-a04f-e789cca758f6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_777fe397-d244-4cb6-a04f-e789cca758f6_0_">
                      <gml:posList srsDimension="3">93362.3 437022.72 1.4759999999924 93358.14 437021.29 1.4759999999924 93358.14 437021.29 7.43841975380501 93362.3 437022.72 7.43792173851184 93362.3 437022.72 1.4759999999924</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_5393d7e1-8c10-4b80-8c9d-5a644e0fb20b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_4176d082-1af6-4bda-a983-33e8aabdee09">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_07528714-350b-41fe-bf46-449a4d9af913">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_07528714-350b-41fe-bf46-449a4d9af913_0_">
                      <gml:posList srsDimension="3">93364.18 437022.33 1.4759999999924 93362.3 437022.72 1.4759999999924 93362.3 437022.72 7.43792173851184 93364.18 437022.33 7.43870100498767 93364.18 437022.33 1.4759999999924</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_72753454-9d1c-467d-82f1-c9a17c385ebc">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_3d520346-d951-4175-87af-c97fb5ac2aea">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_aa42d875-0abb-4f26-9e9d-e7a50ba71cab">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_aa42d875-0abb-4f26-9e9d-e7a50ba71cab_0_">
                      <gml:posList srsDimension="3">93362.6190765406 437017.839900176 14.0387010049877 93361.4365945166 437018.292010759 14.0387010049877 93361.4365945166 437018.292010759 7.43819857566583 93362.6190765406 437017.839900176 7.43819857566583 93362.6190765406 437017.839900176 14.0387010049877</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:AddressDetails>
              <xAL:Country>
                <xAL:CountryName>Nederland</xAL:CountryName>
                <xAL:Locality Type="Town">
                  <xAL:LocalityName>Rotterdam</xAL:LocalityName>
                </xAL:Locality>
              </xAL:Country>
            </xAL:AddressDetails>
          </xalAddress>
          <multiPoint>
            <gml:MultiPoint>
              <gml:pointMember>
                <gml:Point>
                  <gml:pos srsDimension="3">93360.3766666666 437019.823333333 1.95536666666456</gml:pos>
                </gml:Point>
              </gml:pointMember>
            </gml:MultiPoint>
          </multiPoint>
        </Address>
      </bldg:address>
    </bldg:Building>
  </cityObjectMember>
  <cityObjectMember>
    <bldg:Building gml:id="ID_0599100000245641">
      <gml:boundedBy>
        <gml:Envelope srsName="urn:ogc:def:crs:EPSG::28992" srsDimension="3">
          <gml:lowerCorner>93424.969 437044.503 1.32277999999984</gml:lowerCorner>
          <gml:upperCorner>93431.763 437052.215 7.40747599893203</gml:upperCorner>
        </gml:Envelope>
      </gml:boundedBy>
      <creationDate>2019-06-11</creationDate>
      <gen:stringAttribute name="statusOmschr">
        <gen:value>Pand in gebruik</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="gebouwnummer">
        <gen:value>0599100000245641</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="typeOmschr">
        <gen:value>vrijstaand</gen:value>
      </gen:stringAttribute>
      <gen:intAttribute name="aantalBouwlagen">
        <gen:value>2</gen:value>
      </gen:intAttribute>
      <gen:intAttribute name="hoogste_bouwlaag">
        <gen:value>0</gen:value>
      </gen:intAttribute>
      <gen:intAttribute name="laagste_bouwlaag">
        <gen:value>1</gen:value>
      </gen:intAttribute>
      <app:appearance>
        <app:Appearance gml:id="UUID_e97522cb-e4f3-4bd9-bd5c-b74938e26bbd">
          <app:theme>RhinoCity texturing</app:theme>
          <app:surfaceDataMember>
            <app:ParameterizedTexture gml:id="UUID_97424ee0-a5da-4af3-9068-c3add21f7dc2">
              <app:imageURI>appearance/tex_29.jpg</app:imageURI>
              <app:textureType>specific</app:textureType>
              <app:wrapMode>border</app:wrapMode>
              <app:borderColor>0.0 0.0 0.0 1.0</app:borderColor>
              <app:target uri="#RCID_231e463f-1f4a-4766-a1cd-11f3218b5feb">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_231e463f-1f4a-4766-a1cd-11f3218b5feb_0_">0.583526 0.536413 0.577443 0.537147 0.571289 0.537589 0.565059 0.537761 0.55896 0.537657 0.552941 0.537279 0.634793 0.491194 0.638809 0.494056 0.641665 0.497198 0.643267 0.500516 0.643624 0.503947 0.642642 0.50741 0.640379 0.510841 0.637288 0.51385 0.620411 0.522452 0.617494 0.524806 0.614026 0.527027 0.609959 0.529094 0.605449 0.530983 0.600444 0.532696 0.595103 0.534186 0.589429 0.535433 0.583526 0.536413</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_dced9296-c83a-4e77-99aa-02081bf54083">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_dced9296-c83a-4e77-99aa-02081bf54083_0_">0.064967 0.083651 0.075222 0.083192 0.085473 0.08336 0.095449 0.084178 0.104997 0.085579 0.218962 0.01771 0.219872 0.015482 0.221525 0.01332 0.223814 0.011245 0.226679 0.009302 0.23017 0.007538 0.234179 0.005973 0.238595 0.004632 0.243416 0.003537 0.248478 0.002734 0.253728 0.002199 0.259057 0.001957 0.264411 0.002007 0.269627 0.002372 0.274655 0.00303 0.279441 0.003959 0.283772 0.005159 0.287703 0.006607 0.291131 0.008259 0.354753 0.0258 0.360717 0.027756 0.36578 0.030142 0.369737 0.032868 0.372491 0.035844 0.373942 0.039003 0.374044 0.042256 0.372863 0.04549 0.370354 0.048639 0.366635 0.051566 0.258355 0.119509 0.265532 0.121496 0.271866 0.123909 0.277198 0.126727 0.192591 0.17392 0.186592 0.173071 0.180939 0.171954 0.175575 0.170591 0.170662 0.168959 0.166251 0.167102 0.157335 0.171141 0.033989 0.137436 0.0276 0.135471 0.021829 0.133169 0.016773 0.130618 0.012487 0.127819 0.008966 0.124816 0.006366 0.121653 0.004687 0.118353 0.003922 0.114982 0.00412 0.111585 0.020782 0.094515 0.028019 0.091337 0.036232 0.088602 0.045256 0.086379 0.054871 0.084714 0.064967 0.083651</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_446054f3-9999-4d93-9ecf-98543cba56dd">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_446054f3-9999-4d93-9ecf-98543cba56dd_0_">0.464735 0.566708 0.352941 0.540637 0.379102 0.491194 0.490511 0.51757 0.464735 0.566708</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_26fe8816-35ad-4fab-ab08-42a3de143a42">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_26fe8816-35ad-4fab-ab08-42a3de143a42_0_">0.486275 0.39229 0.489501 0.391389 0.555492 0.484785 0.552258 0.485691 0.486275 0.39229</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_408b106b-6497-4e63-9c8f-dd483e71b12f">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_408b106b-6497-4e63-9c8f-dd483e71b12f_0_">0.65098 0.292568 0.653873 0.291585 0.719857 0.384986 0.716957 0.385974 0.65098 0.292568</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_f8f00818-9453-4c80-bfb7-757410668f28">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_f8f00818-9453-4c80-bfb7-757410668f28_0_">0.152941 0.491194 0.156957 0.492117 0.170364 0.583511 0.166334 0.582591 0.152941 0.491194</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_1c8dd74a-e6d9-4e46-aead-f631541d19b5">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_1c8dd74a-e6d9-4e46-aead-f631541d19b5_0_">0.882353 0.391389 0.886571 0.392044 0.899963 0.483441 0.89573 0.482789 0.882353 0.391389</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_3a119d15-e3c9-40e3-9da6-5b4a2bbc9f5a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_3a119d15-e3c9-40e3-9da6-5b4a2bbc9f5a_0_">0.270588 0.491194 0.274965 0.491558 0.288342 0.582918 0.283949 0.582556 0.270588 0.491194</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_5898b2a9-b162-4092-90cc-ea38a671dccc">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_5898b2a9-b162-4092-90cc-ea38a671dccc_0_">0.243137 0.491194 0.247629 0.491245 0.26099 0.582608 0.256481 0.582558 0.243137 0.491194</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d65b4889-38ea-49bf-b756-38c77305f891">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d65b4889-38ea-49bf-b756-38c77305f891_0_">0.298039 0.491433 0.30251 0.491194 0.315853 0.582558 0.311365 0.582798 0.298039 0.491433</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_ca0523eb-15e1-425b-8cd1-1399f043bd61">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_ca0523eb-15e1-425b-8cd1-1399f043bd61_0_">0.32549 0.491722 0.329894 0.491194 0.34322 0.582559 0.338799 0.583088 0.32549 0.491722</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c6bf3e8e-1986-4977-b08a-955fa508b725">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c6bf3e8e-1986-4977-b08a-955fa508b725_0_">0.729412 0.178668 0.733534 0.178082 0.768524 0.273024 0.764386 0.273608 0.729412 0.178668</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9e27d5f6-747d-4933-8069-d78b036d6fd7">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9e27d5f6-747d-4933-8069-d78b036d6fd7_0_">0.682353 0.178883 0.686336 0.178082 0.721311 0.273022 0.717313 0.273821 0.682353 0.178883</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_16e1e84f-e884-484f-a979-b079bf40e1bf">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_16e1e84f-e884-484f-a979-b079bf40e1bf_0_">0.635294 0.179065 0.639 0.178082 0.67396 0.273058 0.670239 0.274038 0.635294 0.179065</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_593e9468-5db3-4266-b164-86630052176e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_593e9468-5db3-4266-b164-86630052176e_0_">0.588235 0.17923 0.591658 0.178082 0.626603 0.273055 0.623166 0.274199 0.588235 0.17923</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_6fa16b3b-792a-4880-a0f9-e48fd23a0b31">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_6fa16b3b-792a-4880-a0f9-e48fd23a0b31_0_">0.541176 0.179378 0.544227 0.178082 0.579158 0.273051 0.576094 0.274343 0.541176 0.179378</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9550fbfb-58ce-4e91-b1f6-9069c53bcfe6">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9550fbfb-58ce-4e91-b1f6-9069c53bcfe6_0_">0.494118 0.17951 0.496705 0.178082 0.531622 0.273046 0.529022 0.274469 0.494118 0.17951</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d99ba542-4e1e-4996-9091-b26af9023fb2">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d99ba542-4e1e-4996-9091-b26af9023fb2_0_">0.729412 0.291585 0.733294 0.292294 0.789619 0.386378 0.785721 0.385662 0.729412 0.291585</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2b8d641a-3165-41d0-af16-61e301845996">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2b8d641a-3165-41d0-af16-61e301845996_0_">0.831373 0.178082 0.835546 0.17857 0.891855 0.272648 0.887663 0.272152 0.831373 0.178082</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_03b67679-4c45-4975-85d2-ec0dd7af7ce5">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_03b67679-4c45-4975-85d2-ec0dd7af7ce5_0_">0.901961 0.178082 0.906398 0.178313 0.962689 0.272383 0.958232 0.272145 0.901961 0.178082</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_09488617-7596-408a-8b8e-f0e1640b708c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_09488617-7596-408a-8b8e-f0e1640b708c_0_">0.384314 0.052175 0.492942 0.001957 0.530321 0.09752 0.421192 0.147546 0.384314 0.052175</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_99c11cb0-2f82-4579-8af2-a00042acf631">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_99c11cb0-2f82-4579-8af2-a00042acf631_0_">0.121569 0.491194 0.129809 0.492588 0.142954 0.583863 0.134684 0.582475 0.121569 0.491194</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_8a3b2a43-964a-4981-95b0-809059f400dd">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_8a3b2a43-964a-4981-95b0-809059f400dd_0_">0.090196 0.491194 0.098806 0.492009 0.111921 0.58329 0.10328 0.58248 0.090196 0.491194</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_e0a6b772-ba5e-4980-97c7-32a8186f54bb">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_e0a6b772-ba5e-4980-97c7-32a8186f54bb_0_">0.180392 0.491194 0.189238 0.491363 0.202321 0.58261 0.193442 0.582444 0.180392 0.491194</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c3292a20-7cb9-42e1-b36f-7bd02a41e972">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c3292a20-7cb9-42e1-b36f-7bd02a41e972_0_">0.211765 0.491646 0.220613 0.491194 0.233663 0.582444 0.224781 0.582898 0.211765 0.491646</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_15bcaabe-ea76-4345-bd98-f173391a3c2e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_15bcaabe-ea76-4345-bd98-f173391a3c2e_0_">0.058824 0.492246 0.067534 0.491194 0.08055 0.582485 0.071806 0.583538 0.058824 0.492246</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_bfa27e7c-29c9-44ab-bdf7-865c82ddc2bb">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_bfa27e7c-29c9-44ab-bdf7-865c82ddc2bb_0_">0.27451 0.179298 0.282434 0.178082 0.317005 0.272849 0.309052 0.274062 0.27451 0.179298</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_e17c877e-ea09-4e84-ae7e-474a6ca4f2f7">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_e17c877e-ea09-4e84-ae7e-474a6ca4f2f7_0_">0.223529 0.17971 0.23108 0.178082 0.265622 0.272846 0.258043 0.274469 0.223529 0.17971</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2891cc35-cd65-447d-8695-70bf8aae8b4f">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2891cc35-cd65-447d-8695-70bf8aae8b4f_0_">0.32549 0.180088 0.332486 0.178082 0.366999 0.272841 0.359975 0.274841 0.32549 0.180088</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_98faca81-1593-4cb9-bdba-08b0d62369c9">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_98faca81-1593-4cb9-bdba-08b0d62369c9_0_">0.376471 0.180417 0.382768 0.178082 0.417253 0.272835 0.410929 0.275161 0.376471 0.180417</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_bd09a229-1ad3-4c6e-81be-64e472922139">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_bd09a229-1ad3-4c6e-81be-64e472922139_0_">0.12549 0.178082 0.158643 0.183245 0.215489 0.27714 0.182197 0.27192 0.12549 0.178082</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_f2aef0b9-0de1-41cf-b582-b553f427b10a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_f2aef0b9-0de1-41cf-b582-b553f427b10a_0_">0.972521 0.485115 0.965463 0.485152 0.909804 0.391438 0.916829 0.391389 0.972521 0.485115</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9095cfc6-747c-473e-9c9d-8ae8988db41a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9095cfc6-747c-473e-9c9d-8ae8988db41a_0_">0.94537 0.385338 0.938173 0.385707 0.882353 0.291966 0.889517 0.291585 0.94537 0.385338</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_6c875d53-8096-48dd-8eaf-9e43eb39041c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_6c875d53-8096-48dd-8eaf-9e43eb39041c_0_">0.066919 0.485131 0.059708 0.485813 0.003922 0.392084 0.011099 0.391389 0.066919 0.485131</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2c8d67d8-cfdd-480b-aee6-6b90c89f1dde">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2c8d67d8-cfdd-480b-aee6-6b90c89f1dde_0_">0.141051 0.485119 0.133992 0.486115 0.078431 0.392397 0.085458 0.391389 0.141051 0.485119</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_874443d2-7099-4871-8cd9-53d10a2c65eb">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_874443d2-7099-4871-8cd9-53d10a2c65eb_0_">0.211434 0.485108 0.204547 0.486418 0.14902 0.39271 0.155874 0.391389 0.211434 0.485108</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_4cec0931-de21-478c-9663-6bd9db4474b5">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_4cec0931-de21-478c-9663-6bd9db4474b5_0_">0.281698 0.485097 0.275103 0.486665 0.219608 0.392967 0.226171 0.391389 0.281698 0.485097</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_4fe1346b-204c-4af6-b8db-89989587e698">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_4fe1346b-204c-4af6-b8db-89989587e698_0_">0.351871 0.485087 0.34566 0.486913 0.290196 0.393224 0.296376 0.391389 0.351871 0.485087</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_f2653f72-75ab-4bcb-851c-47e17ba3bafe">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_f2653f72-75ab-4bcb-851c-47e17ba3bafe_0_">0.422036 0.485078 0.416219 0.487143 0.360784 0.393463 0.366572 0.391389 0.422036 0.485078</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_b728da8f-01da-42a2-b570-9b6c2204cdde">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_b728da8f-01da-42a2-b570-9b6c2204cdde_0_">0.437769 0.486549 0.431373 0.48479 0.470915 0.391389 0.47729 0.393138 0.437769 0.486549</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_de652d9b-024d-46b5-96b4-4f07b06f17c8">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_de652d9b-024d-46b5-96b4-4f07b06f17c8_0_">0.890105 0.125991 0.760784 0.09562 0.803104 0.001957 0.931992 0.03215 0.890105 0.125991</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_cc260062-4707-4ae8-927a-bb4ad9976efe">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_cc260062-4707-4ae8-927a-bb4ad9976efe_0_">0.436921 0.27504 0.427451 0.272237 0.474797 0.178082 0.484224 0.180895 0.436921 0.27504</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_3ba3d091-c75a-4e81-88a2-129d130a4773">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_3ba3d091-c75a-4e81-88a2-129d130a4773_0_">0.70663 0.484946 0.701984 0.486527 0.647059 0.392977 0.651682 0.391389 0.70663 0.484946</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_602363d7-afbd-446f-8a2d-e6024fc6d5db">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_602363d7-afbd-446f-8a2d-e6024fc6d5db_0_">0.722634 0.486076 0.717647 0.48461 0.757654 0.391389 0.762624 0.392847 0.722634 0.486076</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_eb8a18d1-76ad-41a2-93fa-3ecb153bcf6f">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_eb8a18d1-76ad-41a2-93fa-3ecb153bcf6f_0_">0.777829 0.485828 0.772549 0.484603 0.812573 0.391389 0.817836 0.392607 0.777829 0.485828</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_7ffa4890-d792-4c27-b153-c78ef8a908d6">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_7ffa4890-d792-4c27-b153-c78ef8a908d6_0_">0.83289 0.485602 0.827451 0.484597 0.867494 0.391389 0.872914 0.392388 0.83289 0.485602</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_3cc0904d-1ab5-4926-bfe4-c800ae182a3a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_3cc0904d-1ab5-4926-bfe4-c800ae182a3a_0_">0.20525 0.632802 0.2 0.632182 0.217618 0.589041 0.222919 0.589512 0.20525 0.632802</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2fe0965e-624a-41e1-baf0-8c076cd0f2a9">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2fe0965e-624a-41e1-baf0-8c076cd0f2a9_0_">0.17384 0.6324 0.168627 0.632041 0.186197 0.589041 0.191458 0.589259 0.17384 0.6324</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_23b59754-db8e-4905-9558-5f00fb22a2a6">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_23b59754-db8e-4905-9558-5f00fb22a2a6_0_">0.287571 0.631959 0.282353 0.63186 0.299876 0.589076 0.30514 0.589041 0.287571 0.631959</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_cf87dfa4-8589-404b-9b3a-a9aa8a947cf4">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_cf87dfa4-8589-404b-9b3a-a9aa8a947cf4_0_">0.256032 0.631826 0.25098 0.631989 0.268462 0.589327 0.273555 0.589041 0.256032 0.631826</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_80349735-08a2-4306-b081-78d0a3cc6e84">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_80349735-08a2-4306-b081-78d0a3cc6e84_0_">0.106839 0.631784 0.101961 0.632232 0.119405 0.589599 0.12432 0.589041 0.106839 0.631784</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_ffedeb0f-1a44-474d-98b1-d11ba2946f38">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_ffedeb0f-1a44-474d-98b1-d11ba2946f38_0_">0.075219 0.631674 0.070588 0.632367 0.088 0.589832 0.092663 0.589041 0.075219 0.631674</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_90abab20-21b6-431e-a50c-e76f18b80ea9">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_90abab20-21b6-431e-a50c-e76f18b80ea9_0_">0.042186 0.63385 0.039216 0.631897 0.059391 0.589041 0.062394 0.590911 0.042186 0.63385</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_fb9080ae-edaf-492f-acc5-f53cec6e8a2a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_fb9080ae-edaf-492f-acc5-f53cec6e8a2a_0_">0.007412 0.633643 0.003922 0.63183 0.024492 0.589041 0.028008 0.590788 0.007412 0.633643</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2702b219-1c6f-4750-9792-0dc408edbd19">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2702b219-1c6f-4750-9792-0dc408edbd19_0_">0.952927 0.535605 0.94902 0.533931 0.969573 0.491194 0.973497 0.492817 0.952927 0.535605</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d22cf3a6-1d1f-40f0-8238-7847079c23d6">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d22cf3a6-1d1f-40f0-8238-7847079c23d6_0_">0.917942 0.535379 0.913725 0.533898 0.93427 0.491194 0.938496 0.492642 0.917942 0.535379</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_f3245664-9fc4-493a-8bfa-00298debbf53">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_f3245664-9fc4-493a-8bfa-00298debbf53_0_">0.882965 0.535188 0.878431 0.533881 0.898976 0.491194 0.90351 0.492484 0.882965 0.535188</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_79a7c49b-cfcd-4d23-b901-3f20502da71d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_79a7c49b-cfcd-4d23-b901-3f20502da71d_0_">0.847924 0.534961 0.843137 0.533883 0.863692 0.491194 0.868469 0.492274 0.847924 0.534961</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_146713c3-2f5a-45ce-a790-cd353ce633d4">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_146713c3-2f5a-45ce-a790-cd353ce633d4_0_">0.699122 0.534771 0.694118 0.533903 0.71469 0.491194 0.719677 0.492081 0.699122 0.534771</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_5c6f0294-6141-45fc-b49b-b3e1a0a3d939">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_5c6f0294-6141-45fc-b49b-b3e1a0a3d939_0_">0.521718 0.539414 0.501961 0.533977 0.523514 0.491194 0.543271 0.496562 0.521718 0.539414</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_1921a1c5-2d10-47ac-bc99-dd74a3b4100e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_1921a1c5-2d10-47ac-bc99-dd74a3b4100e_0_">0.13967 0.632599 0.133333 0.631722 0.153937 0.589041 0.160244 0.589959 0.13967 0.632599</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_3adc1c07-be5e-466f-8e3b-b44fd890eaa2">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_3adc1c07-be5e-466f-8e3b-b44fd890eaa2_0_">0.66212 0.534493 0.654902 0.533949 0.675881 0.491194 0.68305 0.491812 0.66212 0.534493</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_cc2487d0-33eb-44d2-b47b-8e08c87d6fa3">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_cc2487d0-33eb-44d2-b47b-8e08c87d6fa3_0_">0.237534 0.631618 0.231373 0.631518 0.235849 0.589041 0.24199 0.589245 0.237534 0.631618</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c356cea1-7d1f-4f7c-abe2-05b6dd9c0eb2">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c356cea1-7d1f-4f7c-abe2-05b6dd9c0eb2_0_">0.318226 0.589319 0.324319 0.589041 0.319842 0.631518 0.313726 0.63193 0.318226 0.589319</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_dbdb49a3-f3d1-4f7a-ae54-62fd9f59974d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_dbdb49a3-f3d1-4f7a-ae54-62fd9f59974d_0_">0.733939 0.491918 0.739838 0.491194 0.735337 0.533885 0.729412 0.534766 0.733939 0.491918</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_38840082-4b93-4065-a11c-f9a12a60fc6e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_38840082-4b93-4065-a11c-f9a12a60fc6e_0_">0.74902 0.491916 0.755117 0.491194 0.784928 0.533801 0.778946 0.534702 0.74902 0.491916</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_36489fdd-7604-418b-a27a-f5a3e821cefd">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_36489fdd-7604-418b-a27a-f5a3e821cefd_0_">0.796078 0.49217 0.801975 0.491194 0.831901 0.533979 0.826131 0.535149 0.796078 0.49217</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_33e5a96d-bda6-4550-bed7-258310e2d5b4">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_33e5a96d-bda6-4550-bed7-258310e2d5b4_0_">0.8 0.293043 0.805389 0.291585 0.871823 0.384584 0.866423 0.386051 0.8 0.293043</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d13d0837-cc16-4c39-a437-1bddf4f305c3">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d13d0837-cc16-4c39-a437-1bddf4f305c3_0_">0.321569 0.29322 0.326411 0.291585 0.392834 0.384593 0.38798 0.386235 0.321569 0.29322</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_a158379f-d6bb-42e7-b9bd-9da1e1227432">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_a158379f-d6bb-42e7-b9bd-9da1e1227432_0_">0.701156 0.130207 0.541176 0.096879 0.591973 0.001957 0.751247 0.035476 0.701156 0.130207</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_3b94365d-872d-49db-99d2-600203d706b7">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_3b94365d-872d-49db-99d2-600203d706b7_0_">0.186795 0.387138 0.180392 0.386027 0.228709 0.291585 0.235083 0.292705 0.186795 0.387138</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_8d241376-6949-4e3f-b966-02161d35a643">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_8d241376-6949-4e3f-b966-02161d35a643_0_">0.120414 0.386735 0.113725 0.386036 0.162287 0.291585 0.168946 0.292293 0.120414 0.386735</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_8733f7e9-4451-4c98-b1ab-22d02c1045e6">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_8733f7e9-4451-4c98-b1ab-22d02c1045e6_0_">0.092306 0.385658 0.086275 0.385381 0.097663 0.291585 0.103672 0.291873 0.092306 0.385658</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2dec19b0-a1d9-4040-9a10-e30b8d093e40">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2dec19b0-a1d9-4040-9a10-e30b8d093e40_0_">0.787882 0.178251 0.79388 0.178082 0.782492 0.271878 0.776471 0.272059 0.787882 0.178251</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d06ccef6-14b5-44a7-80b4-3fbe50a0f296">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d06ccef6-14b5-44a7-80b4-3fbe50a0f296_0_">0.815354 0.178727 0.821133 0.178082 0.809722 0.27189 0.803922 0.272546 0.815354 0.178727</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9d178090-bfcd-4c09-99c7-82c123dea948">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9d178090-bfcd-4c09-99c7-82c123dea948_0_">0.003922 0.292265 0.009494 0.291585 0.075816 0.384872 0.070234 0.385562 0.003922 0.292265</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_1835078a-db00-4d14-983a-7cbbb1f9cb4a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_1835078a-db00-4d14-983a-7cbbb1f9cb4a_0_">0.403922 0.292525 0.40932 0.291585 0.475632 0.384882 0.470224 0.385832 0.403922 0.292525</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_efe5403b-a7d8-46e0-864d-bdecf36c0ea3">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_efe5403b-a7d8-46e0-864d-bdecf36c0ea3_0_">0.486275 0.292761 0.491327 0.291585 0.55763 0.384892 0.552567 0.386077 0.486275 0.292761</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_cab80df1-1491-4948-a690-82860c305ca5">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_cab80df1-1491-4948-a690-82860c305ca5_0_">0.568627 0.29295 0.573143 0.291585 0.639435 0.3849 0.63491 0.386272 0.568627 0.29295</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_8d46d39b-e6a0-4aa8-ad5a-3a6713c6ce9b">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_8d46d39b-e6a0-4aa8-ad5a-3a6713c6ce9b_0_">0.003922 0.192581 0.047191 0.178082 0.114636 0.271639 0.071264 0.286204 0.003922 0.192581</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c059d204-ef7c-4e78-b730-4c3fb9e10429">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c059d204-ef7c-4e78-b730-4c3fb9e10429_0_">0.243137 0.29238 0.246602 0.291585 0.312601 0.384975 0.309128 0.385776 0.243137 0.29238</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_a5fabe25-f827-432e-b5e1-8b825d5f6342">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_a5fabe25-f827-432e-b5e1-8b825d5f6342_0_">0.00956 0.585122 0.003922 0.584357 0.024955 0.535445 0.043983 0.491194 0.049602 0.491953 0.00956 0.585122</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_bd614a74-000b-4a27-a23a-663f50ed4833">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_bd614a74-000b-4a27-a23a-663f50ed4833_0_">0.63114 0.485634 0.564706 0.392636 0.570572 0.391389 0.601977 0.43534 0.637018 0.484378 0.63114 0.485634</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
            </app:ParameterizedTexture>
          </app:surfaceDataMember>
        </app:Appearance>
      </app:appearance>
      <bldg:yearOfConstruction>1900</bldg:yearOfConstruction>
      <bldg:lod1Solid>
        <gml:Solid gml:id="ID_7793c42f-03d9-416a-b4f9-7091d3e19474">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_001be353-bc42-4c92-8848-5d6cbf7f7cf2">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ec4ece5f-06f5-4439-b87b-be067bb977d6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ec4ece5f-06f5-4439-b87b-be067bb977d6_0_">
                      <gml:posList srsDimension="3">93426.647 437052.004 1.32277999999984 93426.58 437051.93 1.32277999999984 93426.58 437051.93 7.38900534408311 93426.647 437052.004 7.38900534408311 93426.647 437052.004 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_142b3f93-c56c-447d-8f1f-a1ac3e81df3a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_142b3f93-c56c-447d-8f1f-a1ac3e81df3a_0_">
                      <gml:posList srsDimension="3">93426.58 437051.93 1.32277999999984 93425.36 437051.14 1.32277999999984 93425.36 437051.14 7.38900534408311 93426.58 437051.93 7.38900534408311 93426.58 437051.93 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d62e1122-43f3-4441-8e9a-3a477473beae">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d62e1122-43f3-4441-8e9a-3a477473beae_0_">
                      <gml:posList srsDimension="3">93425.36 437051.14 1.32277999999984 93425.245 437051.052 1.32277999999984 93425.245 437051.052 7.38900534408311 93425.36 437051.14 7.38900534408311 93425.36 437051.14 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_eed03cbd-85ea-4dfb-b209-e9713a9d7b67">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_eed03cbd-85ea-4dfb-b209-e9713a9d7b67_0_">
                      <gml:posList srsDimension="3">93425.245 437051.052 1.32277999999984 93425.146 437050.945 1.32277999999984 93425.146 437050.945 7.38900534408311 93425.245 437051.052 7.38900534408311 93425.245 437051.052 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2fd0040d-96aa-4011-ab7b-8de30e803a01">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2fd0040d-96aa-4011-ab7b-8de30e803a01_0_">
                      <gml:posList srsDimension="3">93425.146 437050.945 1.32277999999984 93425.067 437050.823 1.32277999999984 93425.067 437050.823 7.38900534408311 93425.146 437050.945 7.38900534408311 93425.146 437050.945 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2b0cc5b0-6dbd-4a7a-884c-00776bdd8da1">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2b0cc5b0-6dbd-4a7a-884c-00776bdd8da1_0_">
                      <gml:posList srsDimension="3">93425.067 437050.823 1.32277999999984 93425.01 437050.69 1.32277999999984 93425.01 437050.69 7.38900534408311 93425.067 437050.823 7.38900534408311 93425.067 437050.823 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_be02e9b7-d791-4cef-aa7f-515af517b16b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_be02e9b7-d791-4cef-aa7f-515af517b16b_0_">
                      <gml:posList srsDimension="3">93425.01 437050.69 1.32277999999984 93424.977 437050.549 1.32277999999984 93424.977 437050.549 7.38900534408311 93425.01 437050.69 7.38900534408311 93425.01 437050.69 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6944f064-6e57-4eee-b573-0692b1fc2835">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6944f064-6e57-4eee-b573-0692b1fc2835_0_">
                      <gml:posList srsDimension="3">93424.977 437050.549 1.32277999999984 93424.969 437050.404 1.32277999999984 93424.969 437050.404 7.38900534408311 93424.977 437050.549 7.38900534408311 93424.977 437050.549 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b78dd299-50ba-402a-ba28-70388e008e3c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b78dd299-50ba-402a-ba28-70388e008e3c_0_">
                      <gml:posList srsDimension="3">93424.985 437050.26 7.38900534408311 93424.969 437050.404 7.38900534408311 93424.969 437050.404 1.32277999999984 93424.985 437050.26 1.32277999999984 93424.985 437050.26 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_58b52e28-886c-4a37-a7b6-86add3795892">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_58b52e28-886c-4a37-a7b6-86add3795892_0_">
                      <gml:posList srsDimension="3">93425.026 437050.12 7.38900534408311 93424.985 437050.26 7.38900534408311 93424.985 437050.26 1.32277999999984 93425.026 437050.12 1.32277999999984 93425.026 437050.12 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3d320fdf-dc27-4d5c-a0dc-783da4e680d5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3d320fdf-dc27-4d5c-a0dc-783da4e680d5_0_">
                      <gml:posList srsDimension="3">93425.09 437049.99 7.38900534408311 93425.026 437050.12 7.38900534408311 93425.026 437050.12 1.32277999999984 93425.09 437049.99 1.32277999999984 93425.09 437049.99 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ba6837b0-0e06-4488-935f-32c570573898">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ba6837b0-0e06-4488-935f-32c570573898_0_">
                      <gml:posList srsDimension="3">93426.99 437046.97 7.38900534408311 93425.09 437049.99 7.38900534408311 93425.09 437049.99 1.32277999999984 93426.99 437046.97 1.32277999999984 93426.99 437046.97 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1127a547-c80e-410a-9158-e53e0d9ad432">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1127a547-c80e-410a-9158-e53e0d9ad432_0_">
                      <gml:posList srsDimension="3">93426.99 437046.97 1.32277999999984 93426.852 437046.88 1.32277999999984 93426.852 437046.88 7.38900534408311 93426.99 437046.97 7.38900534408311 93426.99 437046.97 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_fbfd0bf2-cbd6-4729-ae05-dde0ffb273d8">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_fbfd0bf2-cbd6-4729-ae05-dde0ffb273d8_0_">
                      <gml:posList srsDimension="3">93426.852 437046.88 1.32277999999984 93426.729 437046.771 1.32277999999984 93426.729 437046.771 7.38900534408311 93426.852 437046.88 7.38900534408311 93426.852 437046.88 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_33375634-c8a7-474f-9c7b-2583c9b66ed3">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_33375634-c8a7-474f-9c7b-2583c9b66ed3_0_">
                      <gml:posList srsDimension="3">93426.729 437046.771 1.32277999999984 93426.624 437046.644 1.32277999999984 93426.624 437046.644 7.38900534408311 93426.729 437046.771 7.38900534408311 93426.729 437046.771 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5cac4081-946e-46b1-aa69-0064ef75c1e1">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5cac4081-946e-46b1-aa69-0064ef75c1e1_0_">
                      <gml:posList srsDimension="3">93426.624 437046.644 1.32277999999984 93426.54 437046.503 1.32277999999984 93426.54 437046.503 7.38900534408311 93426.624 437046.644 7.38900534408311 93426.624 437046.644 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2de178ca-0de9-42ea-8796-e7ec5cee37dc">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2de178ca-0de9-42ea-8796-e7ec5cee37dc_0_">
                      <gml:posList srsDimension="3">93426.54 437046.503 1.32277999999984 93426.478 437046.35 1.32277999999984 93426.478 437046.35 7.38900534408311 93426.54 437046.503 7.38900534408311 93426.54 437046.503 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_bfb16203-7d8b-41ea-bc1f-45c679c1c4f5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_bfb16203-7d8b-41ea-bc1f-45c679c1c4f5_0_">
                      <gml:posList srsDimension="3">93426.478 437046.35 1.32277999999984 93426.44 437046.19 1.32277999999984 93426.44 437046.19 7.38900534408311 93426.478 437046.35 7.38900534408311 93426.478 437046.35 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c12d6ba1-953c-45dd-ae40-265eb51e096f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c12d6ba1-953c-45dd-ae40-265eb51e096f_0_">
                      <gml:posList srsDimension="3">93426.44 437046.19 1.32277999999984 93426.426 437046.026 1.32277999999984 93426.426 437046.026 7.38900534408311 93426.44 437046.19 7.38900534408311 93426.44 437046.19 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_eb692d76-618b-4d71-9ce2-d811c999ab4f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_eb692d76-618b-4d71-9ce2-d811c999ab4f_0_">
                      <gml:posList srsDimension="3">93426.438 437045.862 7.38900534408311 93426.426 437046.026 7.38900534408311 93426.426 437046.026 1.32277999999984 93426.438 437045.862 1.32277999999984 93426.438 437045.862 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_986d6c12-81c2-469e-a6d9-a02da7f89423">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_986d6c12-81c2-469e-a6d9-a02da7f89423_0_">
                      <gml:posList srsDimension="3">93426.475 437045.701 7.38900534408311 93426.438 437045.862 7.38900534408311 93426.438 437045.862 1.32277999999984 93426.475 437045.701 1.32277999999984 93426.475 437045.701 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e6a5c45e-9cc7-4ce4-b870-5c6f2ef060ba">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e6a5c45e-9cc7-4ce4-b870-5c6f2ef060ba_0_">
                      <gml:posList srsDimension="3">93426.529 437045.561 7.38900534408311 93426.475 437045.701 7.38900534408311 93426.475 437045.701 1.32277999999984 93426.529 437045.561 1.32277999999984 93426.529 437045.561 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1164117c-14b9-43f6-971c-fc6d10baf7f0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1164117c-14b9-43f6-971c-fc6d10baf7f0_0_">
                      <gml:posList srsDimension="3">93426.84 437045.17 7.38900534408311 93426.529 437045.561 7.38900534408311 93426.529 437045.561 1.32277999999984 93426.84 437045.17 1.32277999999984 93426.84 437045.17 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b4f01736-24c2-4c44-90ba-d27790c28525">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b4f01736-24c2-4c44-90ba-d27790c28525_0_">
                      <gml:posList srsDimension="3">93426.892 437045.061 7.38900534408311 93426.84 437045.17 7.38900534408311 93426.84 437045.17 1.32277999999984 93426.892 437045.061 1.32277999999984 93426.892 437045.061 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3604c43e-55c9-4660-9b9d-475f1ab5f642">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3604c43e-55c9-4660-9b9d-475f1ab5f642_0_">
                      <gml:posList srsDimension="3">93426.955 437044.959 7.38900534408311 93426.892 437045.061 7.38900534408311 93426.892 437045.061 1.32277999999984 93426.955 437044.959 1.32277999999984 93426.955 437044.959 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_60e85f84-ab22-46b5-8305-89566dd0f71c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_60e85f84-ab22-46b5-8305-89566dd0f71c_0_">
                      <gml:posList srsDimension="3">93427.03 437044.865 7.38900534408311 93426.955 437044.959 7.38900534408311 93426.955 437044.959 1.32277999999984 93427.03 437044.865 1.32277999999984 93427.03 437044.865 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_95bab96f-093f-467d-bf6f-031972d3e99a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_95bab96f-093f-467d-bf6f-031972d3e99a_0_">
                      <gml:posList srsDimension="3">93427.114 437044.78 7.38900534408311 93427.03 437044.865 7.38900534408311 93427.03 437044.865 1.32277999999984 93427.114 437044.78 1.32277999999984 93427.114 437044.78 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9a14801f-5bff-4963-813e-832a744e9a63">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9a14801f-5bff-4963-813e-832a744e9a63_0_">
                      <gml:posList srsDimension="3">93427.208 437044.704 7.38900534408311 93427.114 437044.78 7.38900534408311 93427.114 437044.78 1.32277999999984 93427.208 437044.704 1.32277999999984 93427.208 437044.704 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b72f3c61-4edf-4b80-ad1c-e97e1df45bef">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b72f3c61-4edf-4b80-ad1c-e97e1df45bef_0_">
                      <gml:posList srsDimension="3">93427.309 437044.639 7.38900534408311 93427.208 437044.704 7.38900534408311 93427.208 437044.704 1.32277999999984 93427.309 437044.639 1.32277999999984 93427.309 437044.639 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_90c59562-4f8a-472f-8cff-b7bbfa212d6f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_90c59562-4f8a-472f-8cff-b7bbfa212d6f_0_">
                      <gml:posList srsDimension="3">93427.417 437044.586 7.38900534408311 93427.309 437044.639 7.38900534408311 93427.309 437044.639 1.32277999999984 93427.417 437044.586 1.32277999999984 93427.417 437044.586 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_48884392-1bc9-4fe6-a9f7-a9beee4c6936">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_48884392-1bc9-4fe6-a9f7-a9beee4c6936_0_">
                      <gml:posList srsDimension="3">93427.53 437044.546 7.38900534408311 93427.417 437044.586 7.38900534408311 93427.417 437044.586 1.32277999999984 93427.53 437044.546 1.32277999999984 93427.53 437044.546 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_dcece1bd-d135-45d3-b66d-5a07d40c9af8">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_dcece1bd-d135-45d3-b66d-5a07d40c9af8_0_">
                      <gml:posList srsDimension="3">93427.647 437044.518 7.38900534408311 93427.53 437044.546 7.38900534408311 93427.53 437044.546 1.32277999999984 93427.647 437044.518 1.32277999999984 93427.647 437044.518 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_53b70694-d4ae-4114-a31d-c0d0cb5b48ed">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_53b70694-d4ae-4114-a31d-c0d0cb5b48ed_0_">
                      <gml:posList srsDimension="3">93427.766 437044.504 7.38900534408311 93427.647 437044.518 7.38900534408311 93427.647 437044.518 1.32277999999984 93427.766 437044.504 1.32277999999984 93427.766 437044.504 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_82ca6643-9669-4186-839d-3a74044d90f6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_82ca6643-9669-4186-839d-3a74044d90f6_0_">
                      <gml:posList srsDimension="3">93427.887 437044.503 7.38900534408311 93427.766 437044.504 7.38900534408311 93427.766 437044.504 1.32277999999984 93427.887 437044.503 1.32277999999984 93427.887 437044.503 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_80260324-9c80-43c1-a559-09295ba5388c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_80260324-9c80-43c1-a559-09295ba5388c_0_">
                      <gml:posList srsDimension="3">93428.006 437044.515 7.38900534408311 93427.887 437044.503 7.38900534408311 93427.887 437044.503 1.32277999999984 93428.006 437044.515 1.32277999999984 93428.006 437044.515 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2337f1ba-ba72-4b3d-8f46-0305a310d03f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2337f1ba-ba72-4b3d-8f46-0305a310d03f_0_">
                      <gml:posList srsDimension="3">93428.124 437044.54 7.38900534408311 93428.006 437044.515 7.38900534408311 93428.006 437044.515 1.32277999999984 93428.124 437044.54 1.32277999999984 93428.124 437044.54 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4e11b51e-e3c2-42c2-890c-916fe3e3d07a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4e11b51e-e3c2-42c2-890c-916fe3e3d07a_0_">
                      <gml:posList srsDimension="3">93428.238 437044.579 7.38900534408311 93428.124 437044.54 7.38900534408311 93428.124 437044.54 1.32277999999984 93428.238 437044.579 1.32277999999984 93428.238 437044.579 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d9113826-a67b-4675-ae01-e0d9b7ea8786">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d9113826-a67b-4675-ae01-e0d9b7ea8786_0_">
                      <gml:posList srsDimension="3">93428.346 437044.63 7.38900534408311 93428.238 437044.579 7.38900534408311 93428.238 437044.579 1.32277999999984 93428.346 437044.63 1.32277999999984 93428.346 437044.63 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_16041210-a4d3-40ca-9287-34039c5700af">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_16041210-a4d3-40ca-9287-34039c5700af_0_">
                      <gml:posList srsDimension="3">93428.449 437044.692 7.38900534408311 93428.346 437044.63 7.38900534408311 93428.346 437044.63 1.32277999999984 93428.449 437044.692 1.32277999999984 93428.449 437044.692 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_08cab056-34df-49c6-a3da-52a58708a5ac">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_08cab056-34df-49c6-a3da-52a58708a5ac_0_">
                      <gml:posList srsDimension="3">93428.544 437044.766 7.38900534408311 93428.449 437044.692 7.38900534408311 93428.449 437044.692 1.32277999999984 93428.544 437044.766 1.32277999999984 93428.544 437044.766 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7b1c177c-9f1b-4117-b706-4bc2d6546dcf">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7b1c177c-9f1b-4117-b706-4bc2d6546dcf_0_">
                      <gml:posList srsDimension="3">93428.63 437044.85 7.38900534408311 93428.544 437044.766 7.38900534408311 93428.544 437044.766 1.32277999999984 93428.63 437044.85 1.32277999999984 93428.63 437044.85 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f94146d1-0a3a-4c09-bb7e-7800d90076ce">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f94146d1-0a3a-4c09-bb7e-7800d90076ce_0_">
                      <gml:posList srsDimension="3">93428.79 437044.67 7.38900534408311 93428.63 437044.85 7.38900534408311 93428.63 437044.85 1.32277999999984 93428.79 437044.67 1.32277999999984 93428.79 437044.67 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3d484ad5-f46b-427d-a179-7511f32d3a93">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3d484ad5-f46b-427d-a179-7511f32d3a93_0_">
                      <gml:posList srsDimension="3">93431.16 437046.2 7.38900534408311 93428.79 437044.67 7.38900534408311 93428.79 437044.67 1.32277999999984 93431.16 437046.2 1.32277999999984 93431.16 437046.2 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_35da2a3e-f8a0-42e5-aef2-e3897df2448a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_35da2a3e-f8a0-42e5-aef2-e3897df2448a_0_">
                      <gml:posList srsDimension="3">93431.283 437046.289 7.38900534408311 93431.16 437046.2 7.38900534408311 93431.16 437046.2 1.32277999999984 93431.283 437046.289 1.32277999999984 93431.283 437046.289 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4b04c286-c865-48d0-a9b0-ad9059404e58">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4b04c286-c865-48d0-a9b0-ad9059404e58_0_">
                      <gml:posList srsDimension="3">93431.395 437046.393 7.38900534408311 93431.283 437046.289 7.38900534408311 93431.283 437046.289 1.32277999999984 93431.395 437046.393 1.32277999999984 93431.395 437046.393 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_afaa4f6f-fa33-4023-9f64-b653a1986d42">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_afaa4f6f-fa33-4023-9f64-b653a1986d42_0_">
                      <gml:posList srsDimension="3">93431.494 437046.508 7.38900534408311 93431.395 437046.393 7.38900534408311 93431.395 437046.393 1.32277999999984 93431.494 437046.508 1.32277999999984 93431.494 437046.508 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c21847e2-a0ba-4d49-92bb-f6bdc715feb0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c21847e2-a0ba-4d49-92bb-f6bdc715feb0_0_">
                      <gml:posList srsDimension="3">93431.579 437046.634 7.38900534408311 93431.494 437046.508 7.38900534408311 93431.494 437046.508 1.32277999999984 93431.579 437046.634 1.32277999999984 93431.579 437046.634 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6bfd2f49-22ea-4365-8e3d-1478268a258e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6bfd2f49-22ea-4365-8e3d-1478268a258e_0_">
                      <gml:posList srsDimension="3">93431.65 437046.769 7.38900534408311 93431.579 437046.634 7.38900534408311 93431.579 437046.634 1.32277999999984 93431.65 437046.769 1.32277999999984 93431.65 437046.769 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f85d6d6a-5b2e-4169-93cc-d14bb933fdd5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f85d6d6a-5b2e-4169-93cc-d14bb933fdd5_0_">
                      <gml:posList srsDimension="3">93431.704 437046.911 7.38900534408311 93431.65 437046.769 7.38900534408311 93431.65 437046.769 1.32277999999984 93431.704 437046.911 1.32277999999984 93431.704 437046.911 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_68349c04-bf93-4a7b-91f0-b18be46ba47b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_68349c04-bf93-4a7b-91f0-b18be46ba47b_0_">
                      <gml:posList srsDimension="3">93431.741 437047.059 7.38900534408311 93431.704 437046.911 7.38900534408311 93431.704 437046.911 1.32277999999984 93431.741 437047.059 1.32277999999984 93431.741 437047.059 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_404a3824-830c-407a-b3c4-e1e58812dd22">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_404a3824-830c-407a-b3c4-e1e58812dd22_0_">
                      <gml:posList srsDimension="3">93431.761 437047.21 7.38900534408311 93431.741 437047.059 7.38900534408311 93431.741 437047.059 1.32277999999984 93431.761 437047.21 1.32277999999984 93431.761 437047.21 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c4a99a5b-8efb-45b3-a481-844e33b608f6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c4a99a5b-8efb-45b3-a481-844e33b608f6_0_">
                      <gml:posList srsDimension="3">93431.763 437047.362 7.38900534408311 93431.761 437047.21 7.38900534408311 93431.761 437047.21 1.32277999999984 93431.763 437047.362 1.32277999999984 93431.763 437047.362 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8f89de96-35c7-4480-9e09-8cbf965c1f30">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8f89de96-35c7-4480-9e09-8cbf965c1f30_0_">
                      <gml:posList srsDimension="3">93431.763 437047.362 1.32277999999984 93431.48 437048.123 1.32277999999984 93431.48 437048.123 7.38900534408311 93431.763 437047.362 7.38900534408311 93431.763 437047.362 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a1b4e887-531d-43d8-8397-d08034e16712">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a1b4e887-531d-43d8-8397-d08034e16712_0_">
                      <gml:posList srsDimension="3">93431.48 437048.123 1.32277999999984 93431.35 437048.264 1.32277999999984 93431.35 437048.264 7.38900534408311 93431.48 437048.123 7.38900534408311 93431.48 437048.123 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7df38058-46a3-4589-a077-ba9528ab0919">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7df38058-46a3-4589-a077-ba9528ab0919_0_">
                      <gml:posList srsDimension="3">93431.35 437048.264 1.32277999999984 93431.201 437048.385 1.32277999999984 93431.201 437048.385 7.38900534408311 93431.35 437048.264 7.38900534408311 93431.35 437048.264 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_aefb993e-1946-4c23-a320-cd36ee9bb3e7">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_aefb993e-1946-4c23-a320-cd36ee9bb3e7_0_">
                      <gml:posList srsDimension="3">93431.201 437048.385 1.32277999999984 93431.036 437048.483 1.32277999999984 93431.036 437048.483 7.38900534408311 93431.201 437048.385 7.38900534408311 93431.201 437048.385 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_dd494c92-13af-426c-b5f8-a888b23f2149">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_dd494c92-13af-426c-b5f8-a888b23f2149_0_">
                      <gml:posList srsDimension="3">93431.036 437048.483 1.32277999999984 93430.859 437048.556 1.32277999999984 93430.859 437048.556 7.38900534408311 93431.036 437048.483 7.38900534408311 93431.036 437048.483 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c8b4d23a-4815-4cc7-8281-f5c54d30f7cb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c8b4d23a-4815-4cc7-8281-f5c54d30f7cb_0_">
                      <gml:posList srsDimension="3">93430.859 437048.556 1.32277999999984 93430.672 437048.602 1.32277999999984 93430.672 437048.602 7.38900534408311 93430.859 437048.556 7.38900534408311 93430.859 437048.556 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4fd2253c-b1ca-4a8a-8259-a5532442e183">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4fd2253c-b1ca-4a8a-8259-a5532442e183_0_">
                      <gml:posList srsDimension="3">93430.672 437048.602 1.32277999999984 93430.481 437048.621 1.32277999999984 93430.481 437048.621 7.38900534408311 93430.672 437048.602 7.38900534408311 93430.672 437048.602 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_409ef6d7-c166-44f4-8f47-f3fcf0eec5e0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_409ef6d7-c166-44f4-8f47-f3fcf0eec5e0_0_">
                      <gml:posList srsDimension="3">93430.481 437048.621 1.32277999999984 93430.289 437048.612 1.32277999999984 93430.289 437048.612 7.38900534408311 93430.481 437048.621 7.38900534408311 93430.481 437048.621 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b55f6625-5b76-445c-b0d9-b6b6d3590fda">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b55f6625-5b76-445c-b0d9-b6b6d3590fda_0_">
                      <gml:posList srsDimension="3">93430.289 437048.612 1.32277999999984 93430.101 437048.574 1.32277999999984 93430.101 437048.574 7.38900534408311 93430.289 437048.612 7.38900534408311 93430.289 437048.612 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_60df8668-75f5-4d93-96d5-c9bc097bc16b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_60df8668-75f5-4d93-96d5-c9bc097bc16b_0_">
                      <gml:posList srsDimension="3">93430.101 437048.574 1.32277999999984 93429.92 437048.51 1.32277999999984 93429.92 437048.51 7.38900534408311 93430.101 437048.574 7.38900534408311 93430.101 437048.574 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_45f97f3d-89f7-4472-9f2a-7b6bb63c4997">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_45f97f3d-89f7-4472-9f2a-7b6bb63c4997_0_">
                      <gml:posList srsDimension="3">93429.92 437048.51 1.32277999999984 93427.91 437051.52 1.32277999999984 93427.91 437051.52 7.38900534408311 93429.92 437048.51 7.38900534408311 93429.92 437048.51 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a6112c8c-7176-43cf-9063-1fd4cd640f85">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a6112c8c-7176-43cf-9063-1fd4cd640f85_0_">
                      <gml:posList srsDimension="3">93427.91 437051.52 1.32277999999984 93427.897 437051.619 1.32277999999984 93427.897 437051.619 7.38900534408311 93427.91 437051.52 7.38900534408311 93427.91 437051.52 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7bc79305-ca6e-45d1-a001-e7d8e300e7b8">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7bc79305-ca6e-45d1-a001-e7d8e300e7b8_0_">
                      <gml:posList srsDimension="3">93427.897 437051.619 1.32277999999984 93427.87 437051.715 1.32277999999984 93427.87 437051.715 7.38900534408311 93427.897 437051.619 7.38900534408311 93427.897 437051.619 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_930ebf47-4f29-4a6f-909d-42f2de314473">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_930ebf47-4f29-4a6f-909d-42f2de314473_0_">
                      <gml:posList srsDimension="3">93427.87 437051.715 1.32277999999984 93427.831 437051.807 1.32277999999984 93427.831 437051.807 7.38900534408311 93427.87 437051.715 7.38900534408311 93427.87 437051.715 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_71ddb8aa-dab9-43a1-b5d8-9957d265e21d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_71ddb8aa-dab9-43a1-b5d8-9957d265e21d_0_">
                      <gml:posList srsDimension="3">93427.831 437051.807 1.32277999999984 93427.781 437051.893 1.32277999999984 93427.781 437051.893 7.38900534408311 93427.831 437051.807 7.38900534408311 93427.831 437051.807 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9e6eee0d-0853-49a6-a56a-0c8f6aa6320b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9e6eee0d-0853-49a6-a56a-0c8f6aa6320b_0_">
                      <gml:posList srsDimension="3">93427.781 437051.893 1.32277999999984 93427.719 437051.971 1.32277999999984 93427.719 437051.971 7.38900534408311 93427.781 437051.893 7.38900534408311 93427.781 437051.893 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f14fe7a7-8faf-4593-8064-98e0afc8fdfd">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f14fe7a7-8faf-4593-8064-98e0afc8fdfd_0_">
                      <gml:posList srsDimension="3">93427.719 437051.971 1.32277999999984 93427.647 437052.04 1.32277999999984 93427.647 437052.04 7.38900534408311 93427.719 437051.971 7.38900534408311 93427.719 437051.971 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6df11e37-2bc7-406d-9605-d20b48604232">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6df11e37-2bc7-406d-9605-d20b48604232_0_">
                      <gml:posList srsDimension="3">93427.647 437052.04 1.32277999999984 93427.567 437052.099 1.32277999999984 93427.567 437052.099 7.38900534408311 93427.647 437052.04 7.38900534408311 93427.647 437052.04 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a393a8c7-d9c9-4bd4-b7c0-07ff65818c61">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a393a8c7-d9c9-4bd4-b7c0-07ff65818c61_0_">
                      <gml:posList srsDimension="3">93427.567 437052.099 1.32277999999984 93427.479 437052.147 1.32277999999984 93427.479 437052.147 7.38900534408311 93427.567 437052.099 7.38900534408311 93427.567 437052.099 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_606cc4e3-e3c3-474d-a2d6-3d2311bb8e0a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_606cc4e3-e3c3-474d-a2d6-3d2311bb8e0a_0_">
                      <gml:posList srsDimension="3">93427.479 437052.147 1.32277999999984 93427.386 437052.182 1.32277999999984 93427.386 437052.182 7.38900534408311 93427.479 437052.147 7.38900534408311 93427.479 437052.147 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0272b80b-8fce-47d5-b6c7-ea46ef6a980d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0272b80b-8fce-47d5-b6c7-ea46ef6a980d_0_">
                      <gml:posList srsDimension="3">93427.386 437052.182 1.32277999999984 93427.289 437052.205 1.32277999999984 93427.289 437052.205 7.38900534408311 93427.386 437052.182 7.38900534408311 93427.386 437052.182 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3c33a81b-604a-45da-ac20-9227cf2f36fb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3c33a81b-604a-45da-ac20-9227cf2f36fb_0_">
                      <gml:posList srsDimension="3">93427.289 437052.205 1.32277999999984 93427.19 437052.215 1.32277999999984 93427.19 437052.215 7.38900534408311 93427.289 437052.205 7.38900534408311 93427.289 437052.205 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_03db9ae2-a52a-4ea9-9bc0-b6b8f5ffc917">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_03db9ae2-a52a-4ea9-9bc0-b6b8f5ffc917_0_">
                      <gml:posList srsDimension="3">93427.19 437052.215 1.32277999999984 93427.09 437052.212 1.32277999999984 93427.09 437052.212 7.38900534408311 93427.19 437052.215 7.38900534408311 93427.19 437052.215 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b15000f3-b19d-4dcb-a3d2-29b94f62232b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b15000f3-b19d-4dcb-a3d2-29b94f62232b_0_">
                      <gml:posList srsDimension="3">93427.09 437052.212 1.32277999999984 93426.992 437052.195 1.32277999999984 93426.992 437052.195 7.38900534408311 93427.09 437052.212 7.38900534408311 93427.09 437052.212 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c4717949-a952-4bd0-bbd8-346b563691ce">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c4717949-a952-4bd0-bbd8-346b563691ce_0_">
                      <gml:posList srsDimension="3">93426.992 437052.195 1.32277999999984 93426.897 437052.165 1.32277999999984 93426.897 437052.165 7.38900534408311 93426.992 437052.195 7.38900534408311 93426.992 437052.195 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_dbe72ade-7526-4c49-81dc-dd86f731e7e9">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_dbe72ade-7526-4c49-81dc-dd86f731e7e9_0_">
                      <gml:posList srsDimension="3">93426.897 437052.165 1.32277999999984 93426.806 437052.123 1.32277999999984 93426.806 437052.123 7.38900534408311 93426.897 437052.165 7.38900534408311 93426.897 437052.165 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_179d1bc7-1301-47ae-9d79-b7f1c6c4a90b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_179d1bc7-1301-47ae-9d79-b7f1c6c4a90b_0_">
                      <gml:posList srsDimension="3">93426.806 437052.123 1.32277999999984 93426.723 437052.069 1.32277999999984 93426.723 437052.069 7.38900534408311 93426.806 437052.123 7.38900534408311 93426.806 437052.123 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_848d0f94-29a4-49f1-b050-73c1e422c7c2">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_848d0f94-29a4-49f1-b050-73c1e422c7c2_0_">
                      <gml:posList srsDimension="3">93426.723 437052.069 1.32277999999984 93426.647 437052.004 1.32277999999984 93426.647 437052.004 7.38900534408311 93426.723 437052.069 7.38900534408311 93426.723 437052.069 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4ebe332b-8bd8-4c0c-a22b-4d7cf269baeb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4ebe332b-8bd8-4c0c-a22b-4d7cf269baeb_0_">
                      <gml:posList srsDimension="3">93431.65 437046.769 7.38900534408311 93431.704 437046.911 7.38900534408311 93431.741 437047.059 7.38900534408311 93431.761 437047.21 7.38900534408311 93431.763 437047.362 7.38900534408311 93431.48 437048.123 7.38900534408311 93431.35 437048.264 7.38900534408311 93431.201 437048.385 7.38900534408311 93431.036 437048.483 7.38900534408311 93430.859 437048.556 7.38900534408311 93430.672 437048.602 7.38900534408311 93430.481 437048.621 7.38900534408311 93430.289 437048.612 7.38900534408311 93430.101 437048.574 7.38900534408311 93429.92 437048.51 7.38900534408311 93427.91 437051.52 7.38900534408311 93427.897 437051.619 7.38900534408311 93427.87 437051.715 7.38900534408311 93427.831 437051.807 7.38900534408311 93427.781 437051.893 7.38900534408311 93427.719 437051.971 7.38900534408311 93427.647 437052.04 7.38900534408311 93427.567 437052.099 7.38900534408311 93427.479 437052.147 7.38900534408311 93427.386 437052.182 7.38900534408311 93427.289 437052.205 7.38900534408311 93427.19 437052.215 7.38900534408311 93427.09 437052.212 7.38900534408311 93426.992 437052.195 7.38900534408311 93426.897 437052.165 7.38900534408311 93426.806 437052.123 7.38900534408311 93426.723 437052.069 7.38900534408311 93426.647 437052.004 7.38900534408311 93426.58 437051.93 7.38900534408311 93425.36 437051.14 7.38900534408311 93425.245 437051.052 7.38900534408311 93425.146 437050.945 7.38900534408311 93425.067 437050.823 7.38900534408311 93425.01 437050.69 7.38900534408311 93424.977 437050.549 7.38900534408311 93424.969 437050.404 7.38900534408311 93424.985 437050.26 7.38900534408311 93425.026 437050.12 7.38900534408311 93425.09 437049.99 7.38900534408311 93426.99 437046.97 7.38900534408311 93426.852 437046.88 7.38900534408311 93426.729 437046.771 7.38900534408311 93426.624 437046.644 7.38900534408311 93426.54 437046.503 7.38900534408311 93426.478 437046.35 7.38900534408311 93426.44 437046.19 7.38900534408311 93426.426 437046.026 7.38900534408311 93426.438 437045.862 7.38900534408311 93426.475 437045.701 7.38900534408311 93426.529 437045.561 7.38900534408311 93426.84 437045.17 7.38900534408311 93426.892 437045.061 7.38900534408311 93426.955 437044.959 7.38900534408311 93427.03 437044.865 7.38900534408311 93427.114 437044.78 7.38900534408311 93427.208 437044.704 7.38900534408311 93427.309 437044.639 7.38900534408311 93427.417 437044.586 7.38900534408311 93427.53 437044.546 7.38900534408311 93427.647 437044.518 7.38900534408311 93427.766 437044.504 7.38900534408311 93427.887 437044.503 7.38900534408311 93428.006 437044.515 7.38900534408311 93428.124 437044.54 7.38900534408311 93428.238 437044.579 7.38900534408311 93428.346 437044.63 7.38900534408311 93428.449 437044.692 7.38900534408311 93428.544 437044.766 7.38900534408311 93428.63 437044.85 7.38900534408311 93428.79 437044.67 7.38900534408311 93431.16 437046.2 7.38900534408311 93431.283 437046.289 7.38900534408311 93431.395 437046.393 7.38900534408311 93431.494 437046.508 7.38900534408311 93431.579 437046.634 7.38900534408311 93431.65 437046.769 7.38900534408311</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9a0cdb90-cc6b-41de-97cc-f739b5448c29">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9a0cdb90-cc6b-41de-97cc-f739b5448c29_0_">
                      <gml:posList srsDimension="3">93431.579 437046.634 1.32277999999984 93431.494 437046.508 1.32277999999984 93431.395 437046.393 1.32277999999984 93431.283 437046.289 1.32277999999984 93431.16 437046.2 1.32277999999984 93428.79 437044.67 1.32277999999984 93428.63 437044.85 1.32277999999984 93428.544 437044.766 1.32277999999984 93428.449 437044.692 1.32277999999984 93428.346 437044.63 1.32277999999984 93428.238 437044.579 1.32277999999984 93428.124 437044.54 1.32277999999984 93428.006 437044.515 1.32277999999984 93427.887 437044.503 1.32277999999984 93427.766 437044.504 1.32277999999984 93427.647 437044.518 1.32277999999984 93427.53 437044.546 1.32277999999984 93427.417 437044.586 1.32277999999984 93427.309 437044.639 1.32277999999984 93427.208 437044.704 1.32277999999984 93427.114 437044.78 1.32277999999984 93427.03 437044.865 1.32277999999984 93426.955 437044.959 1.32277999999984 93426.892 437045.061 1.32277999999984 93426.84 437045.17 1.32277999999984 93426.529 437045.561 1.32277999999984 93426.475 437045.701 1.32277999999984 93426.438 437045.862 1.32277999999984 93426.426 437046.026 1.32277999999984 93426.44 437046.19 1.32277999999984 93426.478 437046.35 1.32277999999984 93426.54 437046.503 1.32277999999984 93426.624 437046.644 1.32277999999984 93426.729 437046.771 1.32277999999984 93426.852 437046.88 1.32277999999984 93426.99 437046.97 1.32277999999984 93425.09 437049.99 1.32277999999984 93425.026 437050.12 1.32277999999984 93424.985 437050.26 1.32277999999984 93424.969 437050.404 1.32277999999984 93424.977 437050.549 1.32277999999984 93425.01 437050.69 1.32277999999984 93425.067 437050.823 1.32277999999984 93425.146 437050.945 1.32277999999984 93425.245 437051.052 1.32277999999984 93425.36 437051.14 1.32277999999984 93426.58 437051.93 1.32277999999984 93426.647 437052.004 1.32277999999984 93426.723 437052.069 1.32277999999984 93426.806 437052.123 1.32277999999984 93426.897 437052.165 1.32277999999984 93426.992 437052.195 1.32277999999984 93427.09 437052.212 1.32277999999984 93427.19 437052.215 1.32277999999984 93427.289 437052.205 1.32277999999984 93427.386 437052.182 1.32277999999984 93427.479 437052.147 1.32277999999984 93427.567 437052.099 1.32277999999984 93427.647 437052.04 1.32277999999984 93427.719 437051.971 1.32277999999984 93427.781 437051.893 1.32277999999984 93427.831 437051.807 1.32277999999984 93427.87 437051.715 1.32277999999984 93427.897 437051.619 1.32277999999984 93427.91 437051.52 1.32277999999984 93429.92 437048.51 1.32277999999984 93430.101 437048.574 1.32277999999984 93430.289 437048.612 1.32277999999984 93430.481 437048.621 1.32277999999984 93430.672 437048.602 1.32277999999984 93430.859 437048.556 1.32277999999984 93431.036 437048.483 1.32277999999984 93431.201 437048.385 1.32277999999984 93431.35 437048.264 1.32277999999984 93431.48 437048.123 1.32277999999984 93431.763 437047.362 1.32277999999984 93431.761 437047.21 1.32277999999984 93431.741 437047.059 1.32277999999984 93431.704 437046.911 1.32277999999984 93431.65 437046.769 1.32277999999984 93431.579 437046.634 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod1Solid>
      <bldg:lod2Solid>
        <gml:Solid gml:id="UUID_06137c32-4635-4e65-b1d6-9901e05ffab8">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_7c4d8ae3-0dcb-454b-9bfb-e73ed67f1ad1">
              <gml:surfaceMember xlink:href="#RCID_7579e586-4d0b-4b3c-8cc6-44f07a0da194"/>
              <gml:surfaceMember xlink:href="#RCID_231e463f-1f4a-4766-a1cd-11f3218b5feb"/>
              <gml:surfaceMember xlink:href="#RCID_dced9296-c83a-4e77-99aa-02081bf54083"/>
              <gml:surfaceMember xlink:href="#RCID_446054f3-9999-4d93-9ecf-98543cba56dd"/>
              <gml:surfaceMember xlink:href="#RCID_26fe8816-35ad-4fab-ab08-42a3de143a42"/>
              <gml:surfaceMember xlink:href="#RCID_408b106b-6497-4e63-9c8f-dd483e71b12f"/>
              <gml:surfaceMember xlink:href="#RCID_f8f00818-9453-4c80-bfb7-757410668f28"/>
              <gml:surfaceMember xlink:href="#RCID_1c8dd74a-e6d9-4e46-aead-f631541d19b5"/>
              <gml:surfaceMember xlink:href="#RCID_3a119d15-e3c9-40e3-9da6-5b4a2bbc9f5a"/>
              <gml:surfaceMember xlink:href="#RCID_5898b2a9-b162-4092-90cc-ea38a671dccc"/>
              <gml:surfaceMember xlink:href="#RCID_d65b4889-38ea-49bf-b756-38c77305f891"/>
              <gml:surfaceMember xlink:href="#RCID_ca0523eb-15e1-425b-8cd1-1399f043bd61"/>
              <gml:surfaceMember xlink:href="#RCID_c6bf3e8e-1986-4977-b08a-955fa508b725"/>
              <gml:surfaceMember xlink:href="#RCID_9e27d5f6-747d-4933-8069-d78b036d6fd7"/>
              <gml:surfaceMember xlink:href="#RCID_16e1e84f-e884-484f-a979-b079bf40e1bf"/>
              <gml:surfaceMember xlink:href="#RCID_593e9468-5db3-4266-b164-86630052176e"/>
              <gml:surfaceMember xlink:href="#RCID_6fa16b3b-792a-4880-a0f9-e48fd23a0b31"/>
              <gml:surfaceMember xlink:href="#RCID_9550fbfb-58ce-4e91-b1f6-9069c53bcfe6"/>
              <gml:surfaceMember xlink:href="#RCID_d99ba542-4e1e-4996-9091-b26af9023fb2"/>
              <gml:surfaceMember xlink:href="#RCID_2b8d641a-3165-41d0-af16-61e301845996"/>
              <gml:surfaceMember xlink:href="#RCID_03b67679-4c45-4975-85d2-ec0dd7af7ce5"/>
              <gml:surfaceMember xlink:href="#RCID_09488617-7596-408a-8b8e-f0e1640b708c"/>
              <gml:surfaceMember xlink:href="#RCID_99c11cb0-2f82-4579-8af2-a00042acf631"/>
              <gml:surfaceMember xlink:href="#RCID_8a3b2a43-964a-4981-95b0-809059f400dd"/>
              <gml:surfaceMember xlink:href="#RCID_e0a6b772-ba5e-4980-97c7-32a8186f54bb"/>
              <gml:surfaceMember xlink:href="#RCID_c3292a20-7cb9-42e1-b36f-7bd02a41e972"/>
              <gml:surfaceMember xlink:href="#RCID_15bcaabe-ea76-4345-bd98-f173391a3c2e"/>
              <gml:surfaceMember xlink:href="#RCID_bfa27e7c-29c9-44ab-bdf7-865c82ddc2bb"/>
              <gml:surfaceMember xlink:href="#RCID_e17c877e-ea09-4e84-ae7e-474a6ca4f2f7"/>
              <gml:surfaceMember xlink:href="#RCID_2891cc35-cd65-447d-8695-70bf8aae8b4f"/>
              <gml:surfaceMember xlink:href="#RCID_98faca81-1593-4cb9-bdba-08b0d62369c9"/>
              <gml:surfaceMember xlink:href="#RCID_bd09a229-1ad3-4c6e-81be-64e472922139"/>
              <gml:surfaceMember xlink:href="#RCID_f2aef0b9-0de1-41cf-b582-b553f427b10a"/>
              <gml:surfaceMember xlink:href="#RCID_9095cfc6-747c-473e-9c9d-8ae8988db41a"/>
              <gml:surfaceMember xlink:href="#RCID_6c875d53-8096-48dd-8eaf-9e43eb39041c"/>
              <gml:surfaceMember xlink:href="#RCID_2c8d67d8-cfdd-480b-aee6-6b90c89f1dde"/>
              <gml:surfaceMember xlink:href="#RCID_874443d2-7099-4871-8cd9-53d10a2c65eb"/>
              <gml:surfaceMember xlink:href="#RCID_4cec0931-de21-478c-9663-6bd9db4474b5"/>
              <gml:surfaceMember xlink:href="#RCID_4fe1346b-204c-4af6-b8db-89989587e698"/>
              <gml:surfaceMember xlink:href="#RCID_f2653f72-75ab-4bcb-851c-47e17ba3bafe"/>
              <gml:surfaceMember xlink:href="#RCID_b728da8f-01da-42a2-b570-9b6c2204cdde"/>
              <gml:surfaceMember xlink:href="#RCID_de652d9b-024d-46b5-96b4-4f07b06f17c8"/>
              <gml:surfaceMember xlink:href="#RCID_cc260062-4707-4ae8-927a-bb4ad9976efe"/>
              <gml:surfaceMember xlink:href="#RCID_3ba3d091-c75a-4e81-88a2-129d130a4773"/>
              <gml:surfaceMember xlink:href="#RCID_602363d7-afbd-446f-8a2d-e6024fc6d5db"/>
              <gml:surfaceMember xlink:href="#RCID_eb8a18d1-76ad-41a2-93fa-3ecb153bcf6f"/>
              <gml:surfaceMember xlink:href="#RCID_7ffa4890-d792-4c27-b153-c78ef8a908d6"/>
              <gml:surfaceMember xlink:href="#RCID_3cc0904d-1ab5-4926-bfe4-c800ae182a3a"/>
              <gml:surfaceMember xlink:href="#RCID_2fe0965e-624a-41e1-baf0-8c076cd0f2a9"/>
              <gml:surfaceMember xlink:href="#RCID_23b59754-db8e-4905-9558-5f00fb22a2a6"/>
              <gml:surfaceMember xlink:href="#RCID_cf87dfa4-8589-404b-9b3a-a9aa8a947cf4"/>
              <gml:surfaceMember xlink:href="#RCID_80349735-08a2-4306-b081-78d0a3cc6e84"/>
              <gml:surfaceMember xlink:href="#RCID_ffedeb0f-1a44-474d-98b1-d11ba2946f38"/>
              <gml:surfaceMember xlink:href="#RCID_90abab20-21b6-431e-a50c-e76f18b80ea9"/>
              <gml:surfaceMember xlink:href="#RCID_fb9080ae-edaf-492f-acc5-f53cec6e8a2a"/>
              <gml:surfaceMember xlink:href="#RCID_2702b219-1c6f-4750-9792-0dc408edbd19"/>
              <gml:surfaceMember xlink:href="#RCID_d22cf3a6-1d1f-40f0-8238-7847079c23d6"/>
              <gml:surfaceMember xlink:href="#RCID_f3245664-9fc4-493a-8bfa-00298debbf53"/>
              <gml:surfaceMember xlink:href="#RCID_79a7c49b-cfcd-4d23-b901-3f20502da71d"/>
              <gml:surfaceMember xlink:href="#RCID_146713c3-2f5a-45ce-a790-cd353ce633d4"/>
              <gml:surfaceMember xlink:href="#RCID_5c6f0294-6141-45fc-b49b-b3e1a0a3d939"/>
              <gml:surfaceMember xlink:href="#RCID_1921a1c5-2d10-47ac-bc99-dd74a3b4100e"/>
              <gml:surfaceMember xlink:href="#RCID_3adc1c07-be5e-466f-8e3b-b44fd890eaa2"/>
              <gml:surfaceMember xlink:href="#RCID_cc2487d0-33eb-44d2-b47b-8e08c87d6fa3"/>
              <gml:surfaceMember xlink:href="#RCID_c356cea1-7d1f-4f7c-abe2-05b6dd9c0eb2"/>
              <gml:surfaceMember xlink:href="#RCID_dbdb49a3-f3d1-4f7a-ae54-62fd9f59974d"/>
              <gml:surfaceMember xlink:href="#RCID_38840082-4b93-4065-a11c-f9a12a60fc6e"/>
              <gml:surfaceMember xlink:href="#RCID_36489fdd-7604-418b-a27a-f5a3e821cefd"/>
              <gml:surfaceMember xlink:href="#RCID_33e5a96d-bda6-4550-bed7-258310e2d5b4"/>
              <gml:surfaceMember xlink:href="#RCID_d13d0837-cc16-4c39-a437-1bddf4f305c3"/>
              <gml:surfaceMember xlink:href="#RCID_a158379f-d6bb-42e7-b9bd-9da1e1227432"/>
              <gml:surfaceMember xlink:href="#RCID_3b94365d-872d-49db-99d2-600203d706b7"/>
              <gml:surfaceMember xlink:href="#RCID_8d241376-6949-4e3f-b966-02161d35a643"/>
              <gml:surfaceMember xlink:href="#RCID_8733f7e9-4451-4c98-b1ab-22d02c1045e6"/>
              <gml:surfaceMember xlink:href="#RCID_2dec19b0-a1d9-4040-9a10-e30b8d093e40"/>
              <gml:surfaceMember xlink:href="#RCID_d06ccef6-14b5-44a7-80b4-3fbe50a0f296"/>
              <gml:surfaceMember xlink:href="#RCID_9d178090-bfcd-4c09-99c7-82c123dea948"/>
              <gml:surfaceMember xlink:href="#RCID_1835078a-db00-4d14-983a-7cbbb1f9cb4a"/>
              <gml:surfaceMember xlink:href="#RCID_efe5403b-a7d8-46e0-864d-bdecf36c0ea3"/>
              <gml:surfaceMember xlink:href="#RCID_cab80df1-1491-4948-a690-82860c305ca5"/>
              <gml:surfaceMember xlink:href="#RCID_8d46d39b-e6a0-4aa8-ad5a-3a6713c6ce9b"/>
              <gml:surfaceMember xlink:href="#RCID_c059d204-ef7c-4e78-b730-4c3fb9e10429"/>
              <gml:surfaceMember xlink:href="#RCID_a5fabe25-f827-432e-b5e1-8b825d5f6342"/>
              <gml:surfaceMember xlink:href="#RCID_bd614a74-000b-4a27-a23a-663f50ed4833"/>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod2Solid>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_65d37542-bcf7-47e6-a1dc-525106f041c3">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_683d4fdd-191e-4495-89c2-62c1a40ef9d2">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_bfa27e7c-29c9-44ab-bdf7-865c82ddc2bb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_bfa27e7c-29c9-44ab-bdf7-865c82ddc2bb_0_">
                      <gml:posList srsDimension="3">93431.036 437048.483 1.32277999999984 93430.859 437048.556 1.32277999999984 93430.859 437048.556 7.39307184427137 93431.036 437048.483 7.39288958334225 93431.036 437048.483 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_f9bde5e8-56ce-487c-930d-a2e8c12321be">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_5a44298b-ebb8-4275-9baf-bfc465cedab7">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_15bcaabe-ea76-4345-bd98-f173391a3c2e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_15bcaabe-ea76-4345-bd98-f173391a3c2e_0_">
                      <gml:posList srsDimension="3">93430.859 437048.556 1.32277999999984 93430.672 437048.602 1.32277999999984 93430.672 437048.602 7.3931109986577 93430.859 437048.556 7.39307184427137 93430.859 437048.556 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_5d3e8768-249c-4dc3-b4ef-81d4c97a453a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_f7a58e34-9357-48ab-88e2-3cb24aeefe6f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3adc1c07-be5e-466f-8e3b-b44fd890eaa2">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3adc1c07-be5e-466f-8e3b-b44fd890eaa2_0_">
                      <gml:posList srsDimension="3">93426.475 437045.701 4.13384631769247 93426.438 437045.862 4.13874766972351 93426.438 437045.862 1.32277999999984 93426.475 437045.701 1.32277999999984 93426.475 437045.701 4.13384631769247</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_007881be-d08e-46be-b871-a3aacfa26b31">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_cb4a81a7-68fc-4a57-913a-829e88c1953f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c3292a20-7cb9-42e1-b36f-7bd02a41e972">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c3292a20-7cb9-42e1-b36f-7bd02a41e972_0_">
                      <gml:posList srsDimension="3">93430.672 437048.602 1.32277999999984 93430.481 437048.621 1.32277999999984 93430.481 437048.621 7.39301306472474 93430.672 437048.602 7.3931109986577 93430.672 437048.602 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_bda5273a-467d-490c-a91e-83a50c0f8f6b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_5b881279-283c-4b65-80cf-7d75e01e24e3">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e0a6b772-ba5e-4980-97c7-32a8186f54bb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e0a6b772-ba5e-4980-97c7-32a8186f54bb_0_">
                      <gml:posList srsDimension="3">93430.481 437048.621 1.32277999999984 93430.289 437048.612 1.32277999999984 93430.289 437048.612 7.39277612283867 93430.481 437048.621 7.39301306472474 93430.481 437048.621 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_2e823b17-8854-4ddc-9ab0-e0163f2dcb82">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_bdbfe35b-d5b0-4aad-afe3-bc34daf577c7">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8a3b2a43-964a-4981-95b0-809059f400dd">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8a3b2a43-964a-4981-95b0-809059f400dd_0_">
                      <gml:posList srsDimension="3">93430.289 437048.612 1.32277999999984 93430.101 437048.574 1.32277999999984 93430.101 437048.574 7.3924002594385 93430.289 437048.612 7.39277612283867 93430.289 437048.612 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_f385eefa-8d9c-4011-b5dd-70664dae4ca2">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_ed85994d-53bf-469d-9de2-e91c1081988b">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1921a1c5-2d10-47ac-bc99-dd74a3b4100e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1921a1c5-2d10-47ac-bc99-dd74a3b4100e_0_">
                      <gml:posList srsDimension="3">93426.529 437045.561 4.13119940057966 93426.475 437045.701 4.13384631769247 93426.475 437045.701 1.32277999999984 93426.529 437045.561 1.32277999999984 93426.529 437045.561 4.13119940057966</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_f89f9705-3780-4e2a-8e02-0a6cf0e5f99c">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_d9925bd6-d2fa-4a15-99fa-54654d188742">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_99c11cb0-2f82-4579-8af2-a00042acf631">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_99c11cb0-2f82-4579-8af2-a00042acf631_0_">
                      <gml:posList srsDimension="3">93430.101 437048.574 1.32277999999984 93429.92 437048.51 1.32277999999984 93429.92 437048.51 7.3919032698772 93430.101 437048.574 7.3924002594385 93430.101 437048.574 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_c861d117-2d2c-4927-b768-ace4d1555541">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_3397ac45-9ac8-4995-a026-d075fae28207">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_09488617-7596-408a-8b8e-f0e1640b708c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_09488617-7596-408a-8b8e-f0e1640b708c_0_">
                      <gml:posList srsDimension="3">93429.92 437048.51 1.32277999999984 93427.91 437051.52 1.32277999999984 93427.91 437051.52 7.40472269339668 93429.92 437048.51 7.3919032698772 93429.92 437048.51 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_316aea7b-91d2-40b4-af24-5908c313e215">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_0143c365-cc3f-4c3f-ab80-0c79c53bc2ea">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5c6f0294-6141-45fc-b49b-b3e1a0a3d939">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5c6f0294-6141-45fc-b49b-b3e1a0a3d939_0_">
                      <gml:posList srsDimension="3">93426.84 437045.17 4.13566066512779 93426.529 437045.561 4.13119940057966 93426.529 437045.561 1.32277999999984 93426.84 437045.17 1.32277999999984 93426.84 437045.17 4.13566066512779</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_a759f0a8-d07b-4b79-8b7d-a791789adadd">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_06e816ac-9456-4593-b622-ba034ec08eca">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_03b67679-4c45-4975-85d2-ec0dd7af7ce5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_03b67679-4c45-4975-85d2-ec0dd7af7ce5_0_">
                      <gml:posList srsDimension="3">93427.91 437051.52 1.32277999999984 93427.897 437051.619 1.32277999999984 93427.897 437051.619 7.4051975998658 93427.91 437051.52 7.40472269339668 93427.91 437051.52 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_f71f2773-b0e4-4a9d-9a1b-8876a49a26b2">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_44701697-2888-4882-86bf-3ca9cdc56b19">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2b8d641a-3165-41d0-af16-61e301845996">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2b8d641a-3165-41d0-af16-61e301845996_0_">
                      <gml:posList srsDimension="3">93427.897 437051.619 1.32277999999984 93427.87 437051.715 1.32277999999984 93427.87 437051.715 7.40564367757164 93427.897 437051.619 7.4051975998658 93427.897 437051.619 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_ae7af3f6-af52-43ba-a5ed-f9bc55c378e6">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e196fcee-8749-4a6e-b9b6-ba5ee2b57e9c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_146713c3-2f5a-45ce-a790-cd353ce633d4">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_146713c3-2f5a-45ce-a790-cd353ce633d4_0_">
                      <gml:posList srsDimension="3">93426.892 437045.061 4.13433667860244 93426.84 437045.17 4.13566066512779 93426.84 437045.17 1.32277999999984 93426.892 437045.061 1.32277999999984 93426.892 437045.061 4.13433667860244</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_cae06e11-1f2e-44fd-be96-b57ea6a9dd76">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_d552d11c-b90d-45f6-9c27-6d4db6272003">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d99ba542-4e1e-4996-9091-b26af9023fb2">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d99ba542-4e1e-4996-9091-b26af9023fb2_0_">
                      <gml:posList srsDimension="3">93427.87 437051.715 1.32277999999984 93427.831 437051.807 1.32277999999984 93427.831 437051.807 7.40605800384192 93427.87 437051.715 7.40564367757164 93427.87 437051.715 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_fbeb1ef1-74fb-4f60-8396-823c82bf8c80">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_31ae921c-0a29-483f-bb2b-6017c0bcf4f9">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9550fbfb-58ce-4e91-b1f6-9069c53bcfe6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9550fbfb-58ce-4e91-b1f6-9069c53bcfe6_0_">
                      <gml:posList srsDimension="3">93427.831 437051.807 1.32277999999984 93427.781 437051.893 1.32277999999984 93427.781 437051.893 7.40643172421991 93427.831 437051.807 7.40605800384192 93427.831 437051.807 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_5ee2d061-515f-4274-8b76-608b235a206f">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e1f7c4c5-02c8-441e-b1bf-3d70f1bd72f2">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_79a7c49b-cfcd-4d23-b901-3f20502da71d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_79a7c49b-cfcd-4d23-b901-3f20502da71d_0_">
                      <gml:posList srsDimension="3">93426.955 437044.959 4.13415883648695 93426.892 437045.061 4.13433667860244 93426.892 437045.061 1.32277999999984 93426.955 437044.959 1.32277999999984 93426.955 437044.959 4.13415883648695</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_a5d18436-7abc-4bb3-bf62-541353ed04b8">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_ff6dd180-2973-4691-ab5e-7ca4e0895137">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6fa16b3b-792a-4880-a0f9-e48fd23a0b31">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6fa16b3b-792a-4880-a0f9-e48fd23a0b31_0_">
                      <gml:posList srsDimension="3">93427.781 437051.893 1.32277999999984 93427.719 437051.971 1.32277999999984 93427.719 437051.971 7.40675397817375 93427.781 437051.893 7.40643172421991 93427.781 437051.893 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_61231630-1538-480b-a518-7fbc954f1514">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_fd2aea58-5003-4e34-8648-f43afa21dd4c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_593e9468-5db3-4266-b164-86630052176e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_593e9468-5db3-4266-b164-86630052176e_0_">
                      <gml:posList srsDimension="3">93427.719 437051.971 1.32277999999984 93427.647 437052.04 1.32277999999984 93427.647 437052.04 7.40702184303163 93427.719 437051.971 7.40675397817375 93427.719 437051.971 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_eee771f0-07e1-4980-aa63-2cca6f690256">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2177cfef-c3db-4c49-8cc3-63f4a1a37e31">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f3245664-9fc4-493a-8bfa-00298debbf53">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f3245664-9fc4-493a-8bfa-00298debbf53_0_">
                      <gml:posList srsDimension="3">93427.03 437044.865 4.13524858804486 93426.955 437044.959 4.13415883648695 93426.955 437044.959 1.32277999999984 93427.03 437044.865 1.32277999999984 93427.03 437044.865 4.13524858804486</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_82a36ce0-44d8-42f4-b051-f11d62158ddb">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_a51ac3f5-b063-44a1-b89e-61140da78d93">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_16e1e84f-e884-484f-a979-b079bf40e1bf">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_16e1e84f-e884-484f-a979-b079bf40e1bf_0_">
                      <gml:posList srsDimension="3">93427.647 437052.04 1.32277999999984 93427.567 437052.099 1.32277999999984 93427.567 437052.099 7.40723239612037 93427.647 437052.04 7.40702184303163 93427.647 437052.04 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_295978f0-5a94-4db3-bbed-f546ace73b5b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_5127f3eb-3bac-4c12-afa7-07326eb28e51">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9e27d5f6-747d-4933-8069-d78b036d6fd7">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9e27d5f6-747d-4933-8069-d78b036d6fd7_0_">
                      <gml:posList srsDimension="3">93427.567 437052.099 1.32277999999984 93427.479 437052.147 1.32277999999984 93427.479 437052.147 7.40738070869395 93427.567 437052.099 7.40723239612037 93427.567 437052.099 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_3ac9d66e-589c-4ec9-ae41-84dcc965a7c6">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_20ab89d4-4a9b-4f04-9514-450b960c12cb">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d22cf3a6-1d1f-40f0-8238-7847079c23d6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d22cf3a6-1d1f-40f0-8238-7847079c23d6_0_">
                      <gml:posList srsDimension="3">93427.114 437044.78 4.13743138294911 93427.03 437044.865 4.13524858804486 93427.03 437044.865 1.32277999999984 93427.114 437044.78 1.32277999999984 93427.114 437044.78 4.13743138294911</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_82abad63-c888-46c4-98ed-4a8957ea4b30">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_dae81d05-bf2d-45f4-a9f4-d798285d30ca">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c6bf3e8e-1986-4977-b08a-955fa508b725">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c6bf3e8e-1986-4977-b08a-955fa508b725_0_">
                      <gml:posList srsDimension="3">93427.479 437052.147 1.32277999999984 93427.386 437052.182 1.32277999999984 93427.386 437052.182 7.40745993236983 93427.479 437052.147 7.40738070869395 93427.479 437052.147 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d85d0789-354d-4133-95ee-0b308bb0c62c">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_ae77cfc6-505f-4d50-8054-2dcd787721bf">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ca0523eb-15e1-425b-8cd1-1399f043bd61">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ca0523eb-15e1-425b-8cd1-1399f043bd61_0_">
                      <gml:posList srsDimension="3">93427.386 437052.182 1.32277999999984 93427.289 437052.205 1.32277999999984 93427.289 437052.205 7.40747599893203 93427.386 437052.182 7.40745993236983 93427.386 437052.182 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_705bce97-866c-49c2-ae1e-ed3175174e42">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_cab7023e-2c9d-4ef5-9cf5-78632e93d22c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2702b219-1c6f-4750-9792-0dc408edbd19">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2702b219-1c6f-4750-9792-0dc408edbd19_0_">
                      <gml:posList srsDimension="3">93427.208 437044.704 4.14078122110465 93427.114 437044.78 4.13743138294911 93427.114 437044.78 1.32277999999984 93427.208 437044.704 1.32277999999984 93427.208 437044.704 4.14078122110465</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_66d343d7-b7b4-47c0-b350-53bcef04f927">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_af1ffd03-c6ab-43fb-a224-81bb7faff85f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d65b4889-38ea-49bf-b756-38c77305f891">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d65b4889-38ea-49bf-b756-38c77305f891_0_">
                      <gml:posList srsDimension="3">93427.289 437052.205 1.32277999999984 93427.19 437052.215 1.32277999999984 93427.19 437052.215 7.40742598570917 93427.289 437052.205 7.40747599893203 93427.289 437052.205 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_7d7b06ec-d576-4bde-bbfc-13adacae5e04">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_a57a8c41-20df-4481-980c-e43df5c7c0e6">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5898b2a9-b162-4092-90cc-ea38a671dccc">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5898b2a9-b162-4092-90cc-ea38a671dccc_0_">
                      <gml:posList srsDimension="3">93427.19 437052.215 1.32277999999984 93427.09 437052.212 1.32277999999984 93427.09 437052.212 7.40731089573745 93427.19 437052.215 7.40742598570917 93427.19 437052.215 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_2c893ae5-e5ee-4c53-b2b2-36a270c9e22b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_0f8e1cdf-7c71-4e9a-adba-48ae1334a22a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_fb9080ae-edaf-492f-acc5-f53cec6e8a2a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_fb9080ae-edaf-492f-acc5-f53cec6e8a2a_0_">
                      <gml:posList srsDimension="3">93427.309 437044.639 4.14517100155396 93427.208 437044.704 4.14078122110465 93427.208 437044.704 1.32277999999984 93427.309 437044.639 1.32277999999984 93427.309 437044.639 4.14517100155396</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_c371790a-5f17-49b4-9ac3-3fb435e79961">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e6ac6527-ff26-4504-b1ab-edc52c306add">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3a119d15-e3c9-40e3-9da6-5b4a2bbc9f5a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3a119d15-e3c9-40e3-9da6-5b4a2bbc9f5a_0_">
                      <gml:posList srsDimension="3">93427.09 437052.212 1.32277999999984 93426.992 437052.195 1.32277999999984 93426.992 437052.195 7.40712880938168 93427.09 437052.212 7.40731089573745 93427.09 437052.212 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_4c6b6f8c-ed37-45fa-89be-91ad974a232a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_a948ddb5-4891-4baf-a0f4-91acc5fa5aa5">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_90abab20-21b6-431e-a50c-e76f18b80ea9">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_90abab20-21b6-431e-a50c-e76f18b80ea9_0_">
                      <gml:posList srsDimension="3">93427.417 437044.586 4.15064817367386 93427.309 437044.639 4.14517100155396 93427.309 437044.639 1.32277999999984 93427.417 437044.586 1.32277999999984 93427.417 437044.586 4.15064817367386</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_9c0ff67c-bce1-49f6-9755-fbac89745542">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2c67851f-a79c-420f-8074-da01734c10f4">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1c8dd74a-e6d9-4e46-aead-f631541d19b5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1c8dd74a-e6d9-4e46-aead-f631541d19b5_0_">
                      <gml:posList srsDimension="3">93426.992 437052.195 1.32277999999984 93426.897 437052.165 1.32277999999984 93426.897 437052.165 7.40688565842771 93426.992 437052.195 7.40712880938168 93426.992 437052.195 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_bc878b40-37dc-47dd-8b1c-f0b2dca8bdfe">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_b923b3c9-0a56-4818-8ff6-498ae901e91d">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f8f00818-9453-4c80-bfb7-757410668f28">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f8f00818-9453-4c80-bfb7-757410668f28_0_">
                      <gml:posList srsDimension="3">93426.897 437052.165 1.32277999999984 93426.806 437052.123 1.32277999999984 93426.806 437052.123 7.40658737465819 93426.897 437052.165 7.40688565842771 93426.897 437052.165 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_f3bd98a0-f379-46f5-b7c6-ccb37f9726ba">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_9efa13e9-b6d2-428d-9879-e95726f8f9e1">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ffedeb0f-1a44-474d-98b1-d11ba2946f38">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ffedeb0f-1a44-474d-98b1-d11ba2946f38_0_">
                      <gml:posList srsDimension="3">93427.53 437044.546 4.15711218703496 93427.417 437044.586 4.15064817367386 93427.417 437044.586 1.32277999999984 93427.53 437044.546 1.32277999999984 93427.53 437044.546 4.15711218703496</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_5c1aeaa1-225e-491f-b30f-4d4e09d81907">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_81328fe8-bf83-42b5-85eb-9ebdfc734d64">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_408b106b-6497-4e63-9c8f-dd483e71b12f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_408b106b-6497-4e63-9c8f-dd483e71b12f_0_">
                      <gml:posList srsDimension="3">93426.806 437052.123 1.32277999999984 93426.723 437052.069 1.32277999999984 93426.723 437052.069 7.40623797022285 93426.806 437052.123 7.40658737465819 93426.806 437052.123 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_81377ace-a622-4877-b695-8751d5f40e07">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_75663138-d2c8-4b41-ac01-1957b3b1e7bb">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_80349735-08a2-4306-b081-78d0a3cc6e84">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_80349735-08a2-4306-b081-78d0a3cc6e84_0_">
                      <gml:posList srsDimension="3">93427.647 437044.518 4.164441592381 93427.53 437044.546 4.15711218703496 93427.53 437044.546 1.32277999999984 93427.647 437044.518 1.32277999999984 93427.647 437044.518 4.164441592381</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_978832cb-109b-4204-90c5-7ed1e0ae7277">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_3cf12e50-9c65-4f13-9b9f-1dfa40bc4a44">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_26fe8816-35ad-4fab-ab08-42a3de143a42">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_26fe8816-35ad-4fab-ab08-42a3de143a42_0_">
                      <gml:posList srsDimension="3">93426.723 437052.069 1.32277999999984 93426.647 437052.004 1.32277999999984 93426.647 437052.004 7.40584137083153 93426.723 437052.069 7.40623797022285 93426.723 437052.069 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_cd43daa7-85b1-4b08-ab0d-9ad801d56c10">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_f2684e22-31b7-4ca7-8d2c-111492b9237a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_cf87dfa4-8589-404b-9b3a-a9aa8a947cf4">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_cf87dfa4-8589-404b-9b3a-a9aa8a947cf4_0_">
                      <gml:posList srsDimension="3">93427.766 437044.504 4.17258328865577 93427.647 437044.518 4.164441592381 93427.647 437044.518 1.32277999999984 93427.766 437044.504 1.32277999999984 93427.766 437044.504 4.17258328865577</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_c72c8310-74be-4418-81df-e12225df7268">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_993b5fea-df24-4f00-9199-6e3207cbc256">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_446054f3-9999-4d93-9ecf-98543cba56dd">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_446054f3-9999-4d93-9ecf-98543cba56dd_0_">
                      <gml:posList srsDimension="3">93428.124 437044.54 7.37053468923419 93426.624 437046.644 7.37940021698741 93426.624 437046.644 4.18961705518194 93428.124 437044.54 4.20078342801573 93428.124 437044.54 7.37053468923419</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_875d7127-8b74-4f43-a5e3-5bfdfabc85cd">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c477c887-05c5-4773-86b2-9a3f92f81f27">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8d46d39b-e6a0-4aa8-ad5a-3a6713c6ce9b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8d46d39b-e6a0-4aa8-ad5a-3a6713c6ce9b_0_">
                      <gml:posList srsDimension="3">93426.58 437051.93 1.32277999999984 93425.36 437051.14 1.32277999999984 93425.36 437051.14 7.40029202439845 93426.58 437051.93 7.40540944005316 93426.58 437051.93 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_58074489-40bb-4ec5-b973-5fd814d6735b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_805b6e72-3bf8-4249-8b15-dd9634c33a8d">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_23b59754-db8e-4905-9558-5f00fb22a2a6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_23b59754-db8e-4905-9558-5f00fb22a2a6_0_">
                      <gml:posList srsDimension="3">93427.887 437044.503 4.18148982649337 93427.766 437044.504 4.17258328865577 93427.766 437044.504 1.32277999999984 93427.887 437044.503 1.32277999999984 93427.887 437044.503 4.18148982649337</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_922cb61f-a58d-4989-9f8f-3d1efffe1a29">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_9d1a7d40-5009-4170-b03a-b0ab5d1db7b0">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_dced9296-c83a-4e77-99aa-02081bf54083">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_dced9296-c83a-4e77-99aa-02081bf54083_0_">
                      <gml:posList srsDimension="3">93430.672 437048.602 7.3931109986577 93430.481 437048.621 7.39301306472474 93430.289 437048.612 7.39277612283867 93430.101 437048.574 7.3924002594385 93429.92 437048.51 7.3919032698772 93427.91 437051.52 7.40472269339668 93427.897 437051.619 7.4051975998658 93427.87 437051.715 7.40564367757164 93427.831 437051.807 7.40605800384192 93427.781 437051.893 7.40643172421991 93427.719 437051.971 7.40675397817375 93427.647 437052.04 7.40702184303163 93427.567 437052.099 7.40723239612037 93427.479 437052.147 7.40738070869395 93427.386 437052.182 7.40745993236983 93427.289 437052.205 7.40747599893203 93427.19 437052.215 7.40742598570917 93427.09 437052.212 7.40731089573745 93426.992 437052.195 7.40712880938168 93426.897 437052.165 7.40688565842771 93426.806 437052.123 7.40658737465819 93426.723 437052.069 7.40623797022285 93426.647 437052.004 7.40584137083153 93426.58 437051.93 7.40540944005316 93425.36 437051.14 7.40029202439845 93425.245 437051.052 7.39974294537215 93425.146 437050.945 7.39911626874746 93425.067 437050.823 7.398435721665 93425.01 437050.69 7.39772302518572 93424.977 437050.549 7.39699497162548 93424.969 437050.404 7.39627227901087 93424.985 437050.26 7.39557858803758 93425.026 437050.12 7.39492968798527 93425.09 437049.99 7.39435314526173 93426.99 437046.97 7.38137410016795 93426.852 437046.88 7.38079209378824 93426.729 437046.771 7.38013148677532 93426.624 437046.644 7.37940021698741 93428.124 437044.54 7.37053468923419 93428.238 437044.579 7.37084125662071 93428.346 437044.63 7.37120095074723 93428.449 437044.692 7.37160984590484 93428.544 437044.766 7.37206986172781 93428.63 437044.85 7.37257013768565 93428.79 437044.67 7.37184344919281 93431.16 437046.2 7.38176163053956 93431.283 437046.289 7.38232366261227 93431.395 437046.393 7.38294859248027 93431.494 437046.508 7.38361469907985 93431.579 437046.634 7.38432097937438 93431.65 437046.769 7.38505757586957 93431.704 437046.911 7.38581162195984 93431.741 437047.059 7.38657818889872 93431.761 437047.21 7.38734249044363 93431.763 437047.362 7.3880936660641 93431.48 437048.123 7.3915605829824 93431.35 437048.264 7.39212514146144 93431.201 437048.385 7.39257206729091 93431.036 437048.483 7.39288958334225 93430.859 437048.556 7.39307184427137 93430.672 437048.602 7.3931109986577</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_2bd34a1e-0981-47b6-a0a6-ee1bb742df67">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_15a5bb1e-7df0-4cca-9209-ec69501b674a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_cab80df1-1491-4948-a690-82860c305ca5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_cab80df1-1491-4948-a690-82860c305ca5_0_">
                      <gml:posList srsDimension="3">93425.36 437051.14 1.32277999999984 93425.245 437051.052 1.32277999999984 93425.245 437051.052 7.39974294537215 93425.36 437051.14 7.40029202439845 93425.36 437051.14 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_ac017ff7-78b2-4a28-bd10-54335fc0f32a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_ec2def52-784e-44ff-b364-6ccc1d5d8575">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2fe0965e-624a-41e1-baf0-8c076cd0f2a9">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2fe0965e-624a-41e1-baf0-8c076cd0f2a9_0_">
                      <gml:posList srsDimension="3">93428.006 437044.515 4.19086520631413 93427.887 437044.503 4.18148982649337 93427.887 437044.503 1.32277999999984 93428.006 437044.515 1.32277999999984 93428.006 437044.515 4.19086520631413</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_23043b8d-b5c6-4e70-a1af-9e224e963f71">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_0cc0675e-9d34-4d65-b9e7-d55d8d7ef8f5">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_efe5403b-a7d8-46e0-864d-bdecf36c0ea3">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_efe5403b-a7d8-46e0-864d-bdecf36c0ea3_0_">
                      <gml:posList srsDimension="3">93425.245 437051.052 1.32277999999984 93425.146 437050.945 1.32277999999984 93425.146 437050.945 7.39911626874746 93425.245 437051.052 7.39974294537215 93425.245 437051.052 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_5df325eb-ac24-4c4e-8ed0-12dc7408a60d">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_616c3262-354b-46d2-b5d7-d35ca1567821">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3cc0904d-1ab5-4926-bfe4-c800ae182a3a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3cc0904d-1ab5-4926-bfe4-c800ae182a3a_0_">
                      <gml:posList srsDimension="3">93428.124 437044.54 4.20078342801573 93428.006 437044.515 4.19086520631413 93428.006 437044.515 1.32277999999984 93428.124 437044.54 1.32277999999984 93428.124 437044.54 4.20078342801573</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_968ec0e6-4511-453e-89d2-7be8674a60e8">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_dbbe5d5b-264a-488b-8917-1c72dd48e5db">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_231e463f-1f4a-4766-a1cd-11f3218b5feb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_231e463f-1f4a-4766-a1cd-11f3218b5feb_0_">
                      <gml:posList srsDimension="3">93427.53 437044.546 4.15711218703496 93427.647 437044.518 4.164441592381 93427.766 437044.504 4.17258328865577 93427.887 437044.503 4.18148982649337 93428.006 437044.515 4.19086520631413 93428.124 437044.54 4.20078342801573 93426.624 437046.644 4.18961705518194 93426.54 437046.503 4.17671070329442 93426.478 437046.35 4.16486295666966 93426.44 437046.19 4.15445906194338 93426.426 437046.026 4.14564136720959 93426.438 437045.862 4.13874766972351 93426.475 437045.701 4.13384631769247 93426.529 437045.561 4.13119940057966 93426.84 437045.17 4.13566066512779 93426.892 437045.061 4.13433667860244 93426.955 437044.959 4.13415883648695 93427.03 437044.865 4.13524858804486 93427.114 437044.78 4.13743138294911 93427.208 437044.704 4.14078122110465 93427.309 437044.639 4.14517100155396 93427.417 437044.586 4.15064817367386 93427.53 437044.546 4.15711218703496</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_359e4b79-5028-42b4-9695-3596d75eff96">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_089d06b1-1861-46c0-8ee5-658280358925">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7ffa4890-d792-4c27-b153-c78ef8a908d6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7ffa4890-d792-4c27-b153-c78ef8a908d6_0_">
                      <gml:posList srsDimension="3">93428.346 437044.63 7.37120095074723 93428.238 437044.579 7.37084125662071 93428.238 437044.579 1.32277999999984 93428.346 437044.63 1.32277999999984 93428.346 437044.63 7.37120095074723</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_8c48acdd-2406-4a3e-862d-a065c485165d">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c913c0f3-e47a-4c9a-92a0-335ce55e6a27">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1835078a-db00-4d14-983a-7cbbb1f9cb4a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1835078a-db00-4d14-983a-7cbbb1f9cb4a_0_">
                      <gml:posList srsDimension="3">93425.146 437050.945 1.32277999999984 93425.067 437050.823 1.32277999999984 93425.067 437050.823 7.398435721665 93425.146 437050.945 7.39911626874746 93425.146 437050.945 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_a3429984-fa1b-4c64-8d18-2e17f810300e">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_cc5efc2b-5e6e-4507-b598-1e02b6340541">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_eb8a18d1-76ad-41a2-93fa-3ecb153bcf6f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_eb8a18d1-76ad-41a2-93fa-3ecb153bcf6f_0_">
                      <gml:posList srsDimension="3">93428.449 437044.692 7.37160984590484 93428.346 437044.63 7.37120095074723 93428.346 437044.63 1.32277999999984 93428.449 437044.692 1.32277999999984 93428.449 437044.692 7.37160984590484</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:GroundSurface gml:id="UUID_f526052e-ec72-4566-bace-e705f52bcaed">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_fc7af2e7-7404-43e7-aa20-f08b1825ab7c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7579e586-4d0b-4b3c-8cc6-44f07a0da194">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7579e586-4d0b-4b3c-8cc6-44f07a0da194_0_">
                      <gml:posList srsDimension="3">93431.579 437046.634 1.32277999999984 93431.494 437046.508 1.32277999999984 93431.395 437046.393 1.32277999999984 93431.283 437046.289 1.32277999999984 93431.16 437046.2 1.32277999999984 93428.79 437044.67 1.32277999999984 93428.63 437044.85 1.32277999999984 93428.544 437044.766 1.32277999999984 93428.449 437044.692 1.32277999999984 93428.346 437044.63 1.32277999999984 93428.238 437044.579 1.32277999999984 93428.124 437044.54 1.32277999999984 93428.006 437044.515 1.32277999999984 93427.887 437044.503 1.32277999999984 93427.766 437044.504 1.32277999999984 93427.647 437044.518 1.32277999999984 93427.53 437044.546 1.32277999999984 93427.417 437044.586 1.32277999999984 93427.309 437044.639 1.32277999999984 93427.208 437044.704 1.32277999999984 93427.114 437044.78 1.32277999999984 93427.03 437044.865 1.32277999999984 93426.955 437044.959 1.32277999999984 93426.892 437045.061 1.32277999999984 93426.84 437045.17 1.32277999999984 93426.529 437045.561 1.32277999999984 93426.475 437045.701 1.32277999999984 93426.438 437045.862 1.32277999999984 93426.426 437046.026 1.32277999999984 93426.44 437046.19 1.32277999999984 93426.478 437046.35 1.32277999999984 93426.54 437046.503 1.32277999999984 93426.624 437046.644 1.32277999999984 93426.729 437046.771 1.32277999999984 93426.852 437046.88 1.32277999999984 93426.99 437046.97 1.32277999999984 93425.09 437049.99 1.32277999999984 93425.026 437050.12 1.32277999999984 93424.985 437050.26 1.32277999999984 93424.969 437050.404 1.32277999999984 93424.977 437050.549 1.32277999999984 93425.01 437050.69 1.32277999999984 93425.067 437050.823 1.32277999999984 93425.146 437050.945 1.32277999999984 93425.245 437051.052 1.32277999999984 93425.36 437051.14 1.32277999999984 93426.58 437051.93 1.32277999999984 93426.647 437052.004 1.32277999999984 93426.723 437052.069 1.32277999999984 93426.806 437052.123 1.32277999999984 93426.897 437052.165 1.32277999999984 93426.992 437052.195 1.32277999999984 93427.09 437052.212 1.32277999999984 93427.19 437052.215 1.32277999999984 93427.289 437052.205 1.32277999999984 93427.386 437052.182 1.32277999999984 93427.479 437052.147 1.32277999999984 93427.567 437052.099 1.32277999999984 93427.647 437052.04 1.32277999999984 93427.719 437051.971 1.32277999999984 93427.781 437051.893 1.32277999999984 93427.831 437051.807 1.32277999999984 93427.87 437051.715 1.32277999999984 93427.897 437051.619 1.32277999999984 93427.91 437051.52 1.32277999999984 93429.92 437048.51 1.32277999999984 93430.101 437048.574 1.32277999999984 93430.289 437048.612 1.32277999999984 93430.481 437048.621 1.32277999999984 93430.672 437048.602 1.32277999999984 93430.859 437048.556 1.32277999999984 93431.036 437048.483 1.32277999999984 93431.201 437048.385 1.32277999999984 93431.35 437048.264 1.32277999999984 93431.48 437048.123 1.32277999999984 93431.763 437047.362 1.32277999999984 93431.761 437047.21 1.32277999999984 93431.741 437047.059 1.32277999999984 93431.704 437046.911 1.32277999999984 93431.65 437046.769 1.32277999999984 93431.579 437046.634 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:GroundSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_fa791bd6-f638-49df-82df-86f058c75269">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_bbc2c8e9-8375-4b1e-8a70-67d1abf7e8a3">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9d178090-bfcd-4c09-99c7-82c123dea948">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9d178090-bfcd-4c09-99c7-82c123dea948_0_">
                      <gml:posList srsDimension="3">93425.067 437050.823 1.32277999999984 93425.01 437050.69 1.32277999999984 93425.01 437050.69 7.39772302518572 93425.067 437050.823 7.398435721665 93425.067 437050.823 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_8408c20b-537c-4d27-a479-4595b22faec6">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_695b6270-cb52-4471-8a57-330bde60007e">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c059d204-ef7c-4e78-b730-4c3fb9e10429">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c059d204-ef7c-4e78-b730-4c3fb9e10429_0_">
                      <gml:posList srsDimension="3">93426.647 437052.004 1.32277999999984 93426.58 437051.93 1.32277999999984 93426.58 437051.93 7.40540944005316 93426.647 437052.004 7.40584137083153 93426.647 437052.004 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_6d03e9a8-7472-4fc4-aa1b-c703a90dfe62">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_723e63f0-eebe-40d1-b5ee-80577b66a265">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d06ccef6-14b5-44a7-80b4-3fbe50a0f296">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d06ccef6-14b5-44a7-80b4-3fbe50a0f296_0_">
                      <gml:posList srsDimension="3">93425.01 437050.69 1.32277999999984 93424.977 437050.549 1.32277999999984 93424.977 437050.549 7.39699497162548 93425.01 437050.69 7.39772302518572 93425.01 437050.69 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_e79209d3-7efa-4c7b-80fb-a43836f6f8e4">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_947d9671-c1a7-4ca0-ba27-70e36c5da504">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3ba3d091-c75a-4e81-88a2-129d130a4773">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3ba3d091-c75a-4e81-88a2-129d130a4773_0_">
                      <gml:posList srsDimension="3">93428.63 437044.85 7.37257013768565 93428.544 437044.766 7.37206986172781 93428.544 437044.766 1.32277999999984 93428.63 437044.85 1.32277999999984 93428.63 437044.85 7.37257013768565</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_40130b19-e85e-4de2-85e5-86992a2641c3">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c3f8cf8e-da12-485c-9eaa-790814667778">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_cc260062-4707-4ae8-927a-bb4ad9976efe">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_cc260062-4707-4ae8-927a-bb4ad9976efe_0_">
                      <gml:posList srsDimension="3">93428.79 437044.67 7.37184344919281 93428.63 437044.85 7.37257013768565 93428.63 437044.85 1.32277999999984 93428.79 437044.67 1.32277999999984 93428.79 437044.67 7.37184344919281</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_c051dfda-8351-4d56-bcc5-57eed6640588">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e886772d-f20f-48e0-a5cb-bf23d8409e86">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2dec19b0-a1d9-4040-9a10-e30b8d093e40">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2dec19b0-a1d9-4040-9a10-e30b8d093e40_0_">
                      <gml:posList srsDimension="3">93424.977 437050.549 1.32277999999984 93424.969 437050.404 1.32277999999984 93424.969 437050.404 7.39627227901087 93424.977 437050.549 7.39699497162548 93424.977 437050.549 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d96e576c-a3f1-45a4-8dde-f940e2d84b92">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2d3d03da-c57f-4ee0-b9c4-bcf47f858942">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a5fabe25-f827-432e-b5e1-8b825d5f6342">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a5fabe25-f827-432e-b5e1-8b825d5f6342_0_">
                      <gml:posList srsDimension="3">93428.238 437044.579 7.37084125662071 93428.124 437044.54 7.37053468923419 93428.124 437044.54 4.20078342801573 93428.124 437044.54 1.32277999999984 93428.238 437044.579 1.32277999999984 93428.238 437044.579 7.37084125662071</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_c751a3fc-12d0-4cec-8c3e-b364c3c2af42">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_011ac618-f4cc-4f39-9812-eda3e5a4af55">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_de652d9b-024d-46b5-96b4-4f07b06f17c8">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_de652d9b-024d-46b5-96b4-4f07b06f17c8_0_">
                      <gml:posList srsDimension="3">93431.16 437046.2 7.38176163053956 93428.79 437044.67 7.37184344919281 93428.79 437044.67 1.32277999999984 93431.16 437046.2 1.32277999999984 93431.16 437046.2 7.38176163053956</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_69a737c0-a0e3-45b3-b347-12ba6558dc9a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e0b9e7cb-f739-4424-946b-db90c98aa16b">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8733f7e9-4451-4c98-b1ab-22d02c1045e6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8733f7e9-4451-4c98-b1ab-22d02c1045e6_0_">
                      <gml:posList srsDimension="3">93424.985 437050.26 7.39557858803758 93424.969 437050.404 7.39627227901087 93424.969 437050.404 1.32277999999984 93424.985 437050.26 1.32277999999984 93424.985 437050.26 7.39557858803758</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_1e3c8d30-c3a1-434b-85fb-b1af85107000">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_a9a41244-e405-44a9-b103-2392fabfc490">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_bd614a74-000b-4a27-a23a-663f50ed4833">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_bd614a74-000b-4a27-a23a-663f50ed4833_0_">
                      <gml:posList srsDimension="3">93426.729 437046.771 7.38013148677532 93426.729 437046.771 1.32277999999984 93426.624 437046.644 1.32277999999984 93426.624 437046.644 4.18961705518194 93426.624 437046.644 7.37940021698741 93426.729 437046.771 7.38013148677532</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_ca233a26-7b99-4bdd-a45d-1c50a3fbb554">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_9053edb6-352b-4418-8501-19ebf9dd66a9">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b728da8f-01da-42a2-b570-9b6c2204cdde">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b728da8f-01da-42a2-b570-9b6c2204cdde_0_">
                      <gml:posList srsDimension="3">93431.283 437046.289 7.38232366261227 93431.16 437046.2 7.38176163053956 93431.16 437046.2 1.32277999999984 93431.283 437046.289 1.32277999999984 93431.283 437046.289 7.38232366261227</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_a35b9e40-245b-451a-b407-62802e455580">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e3955590-493e-4703-b090-986b5ca0ae8c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8d241376-6949-4e3f-b966-02161d35a643">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8d241376-6949-4e3f-b966-02161d35a643_0_">
                      <gml:posList srsDimension="3">93425.026 437050.12 7.39492968798527 93424.985 437050.26 7.39557858803758 93424.985 437050.26 1.32277999999984 93425.026 437050.12 1.32277999999984 93425.026 437050.12 7.39492968798527</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_190bfc4f-d215-439c-a5e4-27dee0e4b87a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_00180ddc-ba2a-4338-b5c0-5476fbb15029">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3b94365d-872d-49db-99d2-600203d706b7">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3b94365d-872d-49db-99d2-600203d706b7_0_">
                      <gml:posList srsDimension="3">93425.09 437049.99 7.39435314526173 93425.026 437050.12 7.39492968798527 93425.026 437050.12 1.32277999999984 93425.09 437049.99 1.32277999999984 93425.09 437049.99 7.39435314526173</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_625d9690-6421-4a27-80fd-019a393d21b0">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_d8b6fd91-6b12-4795-a14c-c457ac08545e">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_602363d7-afbd-446f-8a2d-e6024fc6d5db">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_602363d7-afbd-446f-8a2d-e6024fc6d5db_0_">
                      <gml:posList srsDimension="3">93428.544 437044.766 7.37206986172781 93428.449 437044.692 7.37160984590484 93428.449 437044.692 1.32277999999984 93428.544 437044.766 1.32277999999984 93428.544 437044.766 7.37206986172781</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_f00be7ec-bb38-4cd7-bf12-4d8aa88d2108">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_b142953b-b2cd-4fd9-b642-d69eebf82ea4">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f2653f72-75ab-4bcb-851c-47e17ba3bafe">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f2653f72-75ab-4bcb-851c-47e17ba3bafe_0_">
                      <gml:posList srsDimension="3">93431.395 437046.393 7.38294859248027 93431.283 437046.289 7.38232366261227 93431.283 437046.289 1.32277999999984 93431.395 437046.393 1.32277999999984 93431.395 437046.393 7.38294859248027</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_02bf70e2-4cca-4e46-80b1-841f4b723f50">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_5950b176-e149-430e-9333-c386bdd9a4a6">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a158379f-d6bb-42e7-b9bd-9da1e1227432">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a158379f-d6bb-42e7-b9bd-9da1e1227432_0_">
                      <gml:posList srsDimension="3">93426.99 437046.97 7.38137410016795 93425.09 437049.99 7.39435314526173 93425.09 437049.99 1.32277999999984 93426.99 437046.97 1.32277999999984 93426.99 437046.97 7.38137410016795</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_05a994f6-1c9b-40ae-8f60-af6d09609430">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_6188f8a6-03c4-4f07-9bc2-01ae5bdaf7ef">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4fe1346b-204c-4af6-b8db-89989587e698">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4fe1346b-204c-4af6-b8db-89989587e698_0_">
                      <gml:posList srsDimension="3">93431.494 437046.508 7.38361469907985 93431.395 437046.393 7.38294859248027 93431.395 437046.393 1.32277999999984 93431.494 437046.508 1.32277999999984 93431.494 437046.508 7.38361469907985</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_59174e8a-25b7-4e56-a3b0-eb991bf6631f">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_8316b9fb-49d4-438d-8853-0b08d938ebb6">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d13d0837-cc16-4c39-a437-1bddf4f305c3">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d13d0837-cc16-4c39-a437-1bddf4f305c3_0_">
                      <gml:posList srsDimension="3">93426.99 437046.97 1.32277999999984 93426.852 437046.88 1.32277999999984 93426.852 437046.88 7.38079209378824 93426.99 437046.97 7.38137410016795 93426.99 437046.97 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_1a684af9-3bf9-4a7f-a65f-b2005eee625b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_8db7acc9-ad27-4c05-979d-74880cbeead9">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4cec0931-de21-478c-9663-6bd9db4474b5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4cec0931-de21-478c-9663-6bd9db4474b5_0_">
                      <gml:posList srsDimension="3">93431.579 437046.634 7.38432097937438 93431.494 437046.508 7.38361469907985 93431.494 437046.508 1.32277999999984 93431.579 437046.634 1.32277999999984 93431.579 437046.634 7.38432097937438</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_3daf81fa-b701-4d8a-897c-e2eda65a855a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_d211da03-9c08-43a2-b191-88ef93fe75c0">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_33e5a96d-bda6-4550-bed7-258310e2d5b4">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_33e5a96d-bda6-4550-bed7-258310e2d5b4_0_">
                      <gml:posList srsDimension="3">93426.852 437046.88 1.32277999999984 93426.729 437046.771 1.32277999999984 93426.729 437046.771 7.38013148677532 93426.852 437046.88 7.38079209378824 93426.852 437046.88 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_97b06ffe-58f7-4b30-92b5-ce8fdf546bbc">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_06c02e86-c27c-47f9-8266-e9d84877b6d2">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_874443d2-7099-4871-8cd9-53d10a2c65eb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_874443d2-7099-4871-8cd9-53d10a2c65eb_0_">
                      <gml:posList srsDimension="3">93431.65 437046.769 7.38505757586957 93431.579 437046.634 7.38432097937438 93431.579 437046.634 1.32277999999984 93431.65 437046.769 1.32277999999984 93431.65 437046.769 7.38505757586957</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_9930d0af-fc9d-482f-90b7-895c94a043b2">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_f9c6c677-a9ad-4beb-9d29-04216fd4e91a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_36489fdd-7604-418b-a27a-f5a3e821cefd">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_36489fdd-7604-418b-a27a-f5a3e821cefd_0_">
                      <gml:posList srsDimension="3">93426.624 437046.644 1.32277999999984 93426.54 437046.503 1.32277999999984 93426.54 437046.503 4.17671070329442 93426.624 437046.644 4.18961705518194 93426.624 437046.644 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_a78cdfa1-d168-462c-9042-de5f8fa8b853">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_34da1e57-d8b4-46ed-afd2-12cbaf0b1f23">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2c8d67d8-cfdd-480b-aee6-6b90c89f1dde">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2c8d67d8-cfdd-480b-aee6-6b90c89f1dde_0_">
                      <gml:posList srsDimension="3">93431.704 437046.911 7.38581162195984 93431.65 437046.769 7.38505757586957 93431.65 437046.769 1.32277999999984 93431.704 437046.911 1.32277999999984 93431.704 437046.911 7.38581162195984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_8a908673-ee03-4e8e-9d12-903439820342">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_72df5360-a646-4e95-ae1e-4a1f7d5debc7">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_38840082-4b93-4065-a11c-f9a12a60fc6e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_38840082-4b93-4065-a11c-f9a12a60fc6e_0_">
                      <gml:posList srsDimension="3">93426.54 437046.503 1.32277999999984 93426.478 437046.35 1.32277999999984 93426.478 437046.35 4.16486295666966 93426.54 437046.503 4.17671070329442 93426.54 437046.503 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_063a1225-18f1-4185-a9c0-0c97501a35d9">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_949bc3c0-469d-4b4b-8a85-2d6aefc1bf51">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6c875d53-8096-48dd-8eaf-9e43eb39041c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6c875d53-8096-48dd-8eaf-9e43eb39041c_0_">
                      <gml:posList srsDimension="3">93431.741 437047.059 7.38657818889872 93431.704 437046.911 7.38581162195984 93431.704 437046.911 1.32277999999984 93431.741 437047.059 1.32277999999984 93431.741 437047.059 7.38657818889872</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_3a718cbc-51a7-4673-b0be-7ce47ca696d7">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_fc20c6b2-a1dc-4a3f-8319-8fcd8660d335">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9095cfc6-747c-473e-9c9d-8ae8988db41a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9095cfc6-747c-473e-9c9d-8ae8988db41a_0_">
                      <gml:posList srsDimension="3">93431.761 437047.21 7.38734249044363 93431.741 437047.059 7.38657818889872 93431.741 437047.059 1.32277999999984 93431.761 437047.21 1.32277999999984 93431.761 437047.21 7.38734249044363</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_b43b6e6a-4b50-4628-8507-38146f276f70">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_8d091896-f496-4362-9b39-82d35df5f590">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_dbdb49a3-f3d1-4f7a-ae54-62fd9f59974d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_dbdb49a3-f3d1-4f7a-ae54-62fd9f59974d_0_">
                      <gml:posList srsDimension="3">93426.478 437046.35 1.32277999999984 93426.44 437046.19 1.32277999999984 93426.44 437046.19 4.15445906194338 93426.478 437046.35 4.16486295666966 93426.478 437046.35 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_5562b669-d3d1-44f5-872b-bade89f26a91">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_75c6addf-5377-4360-974e-40acec157514">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f2aef0b9-0de1-41cf-b582-b553f427b10a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f2aef0b9-0de1-41cf-b582-b553f427b10a_0_">
                      <gml:posList srsDimension="3">93431.763 437047.362 7.3880936660641 93431.761 437047.21 7.38734249044363 93431.761 437047.21 1.32277999999984 93431.763 437047.362 1.32277999999984 93431.763 437047.362 7.3880936660641</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_28856558-425b-4b46-9811-d48722edd9fa">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_b2a4b7db-089a-467d-a5e6-7e947c5a37e8">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c356cea1-7d1f-4f7c-abe2-05b6dd9c0eb2">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c356cea1-7d1f-4f7c-abe2-05b6dd9c0eb2_0_">
                      <gml:posList srsDimension="3">93426.44 437046.19 1.32277999999984 93426.426 437046.026 1.32277999999984 93426.426 437046.026 4.14564136720959 93426.44 437046.19 4.15445906194338 93426.44 437046.19 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d67ed193-311a-40f4-8747-d85a74468b63">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_cfe74479-98f2-4914-b81c-721c46facd2e">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_bd09a229-1ad3-4c6e-81be-64e472922139">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_bd09a229-1ad3-4c6e-81be-64e472922139_0_">
                      <gml:posList srsDimension="3">93431.763 437047.362 1.32277999999984 93431.48 437048.123 1.32277999999984 93431.48 437048.123 7.3915605829824 93431.763 437047.362 7.3880936660641 93431.763 437047.362 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_1fab321a-deb8-46d8-9df5-8a36174e3eb7">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_0feea869-0027-417c-a098-85756539043b">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_98faca81-1593-4cb9-bdba-08b0d62369c9">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_98faca81-1593-4cb9-bdba-08b0d62369c9_0_">
                      <gml:posList srsDimension="3">93431.48 437048.123 1.32277999999984 93431.35 437048.264 1.32277999999984 93431.35 437048.264 7.39212514146144 93431.48 437048.123 7.3915605829824 93431.48 437048.123 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_5515b21f-8f6c-46b1-a0a5-5c295208f032">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_f21b52ef-52bd-4bf4-b230-c79e016b8b2c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2891cc35-cd65-447d-8695-70bf8aae8b4f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2891cc35-cd65-447d-8695-70bf8aae8b4f_0_">
                      <gml:posList srsDimension="3">93431.35 437048.264 1.32277999999984 93431.201 437048.385 1.32277999999984 93431.201 437048.385 7.39257206729091 93431.35 437048.264 7.39212514146144 93431.35 437048.264 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d44b52f3-5f07-45d5-a1f4-c99c4faa5d2c">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_bdce32a7-850e-410e-adcb-fd1ae13b2486">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e17c877e-ea09-4e84-ae7e-474a6ca4f2f7">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e17c877e-ea09-4e84-ae7e-474a6ca4f2f7_0_">
                      <gml:posList srsDimension="3">93431.201 437048.385 1.32277999999984 93431.036 437048.483 1.32277999999984 93431.036 437048.483 7.39288958334225 93431.201 437048.385 7.39257206729091 93431.201 437048.385 1.32277999999984</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_f2670570-fb91-4fee-bfe0-66e479ef4325">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_6bea739c-35ea-4b0b-a1ef-88c2a1b324b9">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_cc2487d0-33eb-44d2-b47b-8e08c87d6fa3">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_cc2487d0-33eb-44d2-b47b-8e08c87d6fa3_0_">
                      <gml:posList srsDimension="3">93426.438 437045.862 4.13874766972351 93426.426 437046.026 4.14564136720959 93426.426 437046.026 1.32277999999984 93426.438 437045.862 1.32277999999984 93426.438 437045.862 4.13874766972351</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:AddressDetails>
              <xAL:Country>
                <xAL:CountryName>Nederland</xAL:CountryName>
                <xAL:Locality Type="Town">
                  <xAL:LocalityName>Rotterdam</xAL:LocalityName>
                  <xAL:Thoroughfare Type="Street">
                    <xAL:ThoroughfareNumber>25</xAL:ThoroughfareNumber>
                    <xAL:ThoroughfareName>Geldersekade</xAL:ThoroughfareName>
                  </xAL:Thoroughfare>
                  <xAL:PostalCode>
                    <xAL:PostalCodeNumber>3011WB</xAL:PostalCodeNumber>
                  </xAL:PostalCode>
                </xAL:Locality>
              </xAL:Country>
            </xAL:AddressDetails>
          </xalAddress>
          <multiPoint>
            <gml:MultiPoint>
              <gml:pointMember>
                <gml:Point>
                  <gml:pos srsDimension="3">93426.7556666666 437052.079333333 3.54997333327574</gml:pos>
                </gml:Point>
              </gml:pointMember>
            </gml:MultiPoint>
          </multiPoint>
        </Address>
      </bldg:address>
    </bldg:Building>
  </cityObjectMember>
  <cityObjectMember>
    <bldg:Building gml:id="ID_0599100000670924">
      <gml:boundedBy>
        <gml:Envelope srsName="urn:ogc:def:crs:EPSG::28992" srsDimension="3">
          <gml:lowerCorner>92903.6999999993 436624.699999999 2.52000000000002</gml:lowerCorner>
          <gml:upperCorner>92923.2100000009 436643.54 16.940625</gml:upperCorner>
        </gml:Envelope>
      </gml:boundedBy>
      <creationDate>2019-06-11</creationDate>
      <gen:stringAttribute name="typeOmschr">
        <gen:value>tussenpand</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="statusOmschr">
        <gen:value>Pand in gebruik</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="gebouwnummer">
        <gen:value>0599100000670924</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="deviation">
        <gen:value>yes</gen:value>
      </gen:stringAttribute>
      <gen:intAttribute name="aantalBouwlagen">
        <gen:value>6</gen:value>
      </gen:intAttribute>
      <gen:intAttribute name="hoogste_bouwlaag">
        <gen:value>4</gen:value>
      </gen:intAttribute>
      <gen:intAttribute name="laagste_bouwlaag">
        <gen:value>1</gen:value>
      </gen:intAttribute>
      <app:appearance>
        <app:Appearance gml:id="UUID_6964e5dd-f49e-4a66-8511-c9a60b02457f">
          <app:theme>RhinoCity texturing</app:theme>
          <app:surfaceDataMember>
            <app:ParameterizedTexture gml:id="UUID_ee647dcd-9820-4f23-8bdd-32d8f8edbe15">
              <app:imageURI>appearance/tex_5.jpg</app:imageURI>
              <app:textureType>specific</app:textureType>
              <app:wrapMode>border</app:wrapMode>
              <app:borderColor>0.0 0.0 0.0 1.0</app:borderColor>
              <app:target uri="#RCID_0867a2d3-0e1d-4fc2-85ff-a38f1f3df283">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_0867a2d3-0e1d-4fc2-85ff-a38f1f3df283_0_">0.15298 0.78219 0.122502 0.812452 0.09589 0.775886 0.126336 0.745597 0.15298 0.78219</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c21f3fe5-60e4-4c00-9f17-4bc498b117ba">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c21f3fe5-60e4-4c00-9f17-4bc498b117ba_0_">0.218555 0.751813 0.238582 0.764486 0.187736 0.813929 0.158513 0.795484 0.209059 0.745597 0.218555 0.751813</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_5f56fb00-2544-4ab8-95d2-d2773e9ada4c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_5f56fb00-2544-4ab8-95d2-d2773e9ada4c_0_">0.540117 0.782466 0.55931 0.745597 0.566736 0.749177 0.547457 0.786214 0.540117 0.782466</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_ecdae91e-4da3-45c5-b629-3ec98971eef7">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_ecdae91e-4da3-45c5-b629-3ec98971eef7_0_">0.467746 0.765858 0.467906 0.769261 0.467551 0.772656 0.466686 0.775994 0.465324 0.779231 0.463482 0.782321 0.461187 0.785222 0.45847 0.787894 0.455369 0.7903 0.451926 0.792408 0.448191 0.794187 0.444213 0.795613 0.440047 0.796667 0.435752 0.797335 0.431387 0.797607 0.427011 0.797479 0.422685 0.796954 0.418468 0.796038 0.414419 0.794744 0.410594 0.793089 0.407045 0.791098 0.414208 0.784302 0.453243 0.745597 0.456568 0.747817 0.459534 0.750325 0.462099 0.753086 0.464229 0.756063 0.465895 0.759213 0.467072 0.762493 0.467746 0.765858</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_49e5f7f2-f5cd-406a-b12e-5ce95a6a0dba">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_49e5f7f2-f5cd-406a-b12e-5ce95a6a0dba_0_">0.535819 0.764901 0.504785 0.795395 0.473581 0.77602 0.504496 0.745597 0.535819 0.764901</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9213f60c-31c1-42c0-aae9-20bb5982e5fb">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9213f60c-31c1-42c0-aae9-20bb5982e5fb_0_">0.240513 0.001957 0.416471 0.113511 0.395432 0.136142 0.424197 0.152493 0.372837 0.202508 0.344173 0.184974 0.287616 0.241394 0.316012 0.258715 0.308652 0.265726 0.281088 0.293471 0.213211 0.361488 0.185051 0.343914 0.178601 0.350171 0.002255 0.240155 0.034166 0.208649 0.001957 0.188704 0.065024 0.126341 0.092543 0.143434 0.123892 0.112476 0.096363 0.09535 0.158728 0.03368 0.188577 0.052556 0.240513 0.001957</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_8b448d66-c148-4e08-89e7-cf23bc735f0a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_8b448d66-c148-4e08-89e7-cf23bc735f0a_0_">0.022036 0.745597 0.041975 0.755666 0.090885 0.779426 0.071013 0.817876 0.001957 0.784428 0.022036 0.745597</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_30704ec4-2fa8-46c8-9509-052ed53f54c6">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_30704ec4-2fa8-46c8-9509-052ed53f54c6_0_">0.376714 0.745597 0.401355 0.758947 0.3831 0.79683 0.356164 0.784531 0.376714 0.745597</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_8b31e72c-8d7b-4460-a096-912ea66308a2">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_8b31e72c-8d7b-4460-a096-912ea66308a2_0_">0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597 0.825832 0.745597</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_955277dc-2074-41ad-a59b-dd7a9aad4498">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_955277dc-2074-41ad-a59b-dd7a9aad4498_0_">0.671877 0.545221 0.602581 0.503183 0.60002 0.45735 0.594912 0.365949 0.663893 0.407977 0.670693 0.524864 0.671877 0.545221</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_b37365bd-6881-442a-976e-07d306084b4d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_b37365bd-6881-442a-976e-07d306084b4d_0_">0.750243 0.498527 0.753062 0.544368 0.685238 0.503197 0.684032 0.48284 0.677104 0.365949 0.74462 0.407111 0.750243 0.498527</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2d50d579-7251-4a46-9434-f1be04fe2a5c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2d50d579-7251-4a46-9434-f1be04fe2a5c_0_">0.686842 0.687324 0.652632 0.666167 0.647749 0.575342 0.681856 0.596496 0.686842 0.687324</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_f53fc387-57e2-4d64-bd43-e7b316cff5e5">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_f53fc387-57e2-4d64-bd43-e7b316cff5e5_0_">0.610927 0.700054 0.555494 0.66633 0.549902 0.575342 0.605169 0.609062 0.610927 0.700054</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2b21aaf5-5102-4740-87fc-3dbbadfe381e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2b21aaf5-5102-4740-87fc-3dbbadfe381e_0_">0.337615 0.712581 0.304109 0.691859 0.297456 0.575342 0.330832 0.596061 0.337615 0.712581</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_5fc01134-58a9-4b6c-962b-dcdd73cdcf76">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_5fc01134-58a9-4b6c-962b-dcdd73cdcf76_0_">0.28392 0.745597 0.311985 0.764011 0.31187 0.80862 0.283757 0.7902 0.28392 0.745597</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_0c876cdc-0f3d-44d8-9f3d-fd47c12c2879">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_0c876cdc-0f3d-44d8-9f3d-fd47c12c2879_0_">0.946151 0.654158 0.891215 0.620579 0.888454 0.575342 0.943307 0.60892 0.946151 0.654158</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c949ada8-5415-4524-b50f-6757f87c7973">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c949ada8-5415-4524-b50f-6757f87c7973_0_">0.342466 0.575342 0.36957 0.593503 0.370322 0.70709 0.343225 0.711036 0.342466 0.575342</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_a8070fb9-5cee-488e-a180-21d13593fa04">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_a8070fb9-5cee-488e-a180-21d13593fa04_0_">0.506881 0.092818 0.506945 0.001957 0.680879 0.11313 0.68168 0.249686 0.506849 0.138402 0.506881 0.092818</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_503e5d6d-9d36-4245-a236-7addbc03ed06">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_503e5d6d-9d36-4245-a236-7addbc03ed06_0_">0.851395 0.575342 0.869981 0.588127 0.869923 0.678008 0.851272 0.665214 0.851395 0.575342</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_7b8a6d4c-79ee-4dd3-a18f-64e4b7f14ee3">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_7b8a6d4c-79ee-4dd3-a18f-64e4b7f14ee3_0_">0.874896 0.575342 0.882974 0.581607 0.882861 0.671379 0.874755 0.66511 0.874896 0.575342</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_860cf8ce-9dbd-414d-96d4-1f1cd64b354d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_860cf8ce-9dbd-414d-96d4-1f1cd64b354d_0_">0.525166 0.575342 0.544563 0.58535 0.525274 0.695298 0.524338 0.700632 0.504892 0.690448 0.525166 0.575342</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_7194a724-ecc9-4f54-b057-97a7cda82250">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_7194a724-ecc9-4f54-b057-97a7cda82250_0_">0.874747 0.482179 0.89589 0.365949 0.956906 0.396798 0.936139 0.512346 0.932159 0.53449 0.870842 0.50365 0.874747 0.482179</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_699ead19-ebff-464d-b0de-ebbcdc76ce8b">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_699ead19-ebff-464d-b0de-ebbcdc76ce8b_0_">0.4747 0.575342 0.499411 0.588022 0.478653 0.703833 0.454012 0.690194 0.4747 0.575342</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_a6332cc6-6b6b-406f-9ff9-2776ae446537">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_a6332cc6-6b6b-406f-9ff9-2776ae446537_0_">0.433389 0.204725 0.469022 0.001957 0.502599 0.018605 0.48654 0.110609 0.462423 0.248782 0.428571 0.232141 0.433389 0.204725</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c11f803f-9907-4098-a61b-3f188703b8e3">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c11f803f-9907-4098-a61b-3f188703b8e3_0_">0.631662 0.750707 0.632514 0.745597 0.640226 0.749811 0.635899 0.775817 0.62818 0.771603 0.631662 0.750707</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_ce959514-734f-40cc-bb2a-0c68d6197a7b">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_ce959514-734f-40cc-bb2a-0c68d6197a7b_0_">0.757339 0.503712 0.781656 0.365949 0.865035 0.406854 0.844823 0.523302 0.841126 0.544605 0.757339 0.503712</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_09c29441-77f1-4be2-bd83-feed6a91014e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_09c29441-77f1-4be2-bd83-feed6a91014e_0_">0.646737 0.745597 0.694852 0.768461 0.693915 0.773552 0.645793 0.750675 0.646737 0.745597</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_338328a9-cc25-4b15-84e5-43671a342d82">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_338328a9-cc25-4b15-84e5-43671a342d82_0_">0.635639 0.575342 0.643018 0.579134 0.623865 0.694878 0.616438 0.691188 0.635639 0.575342</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_ce16ee0a-d026-44b4-8570-d699188601ba">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_ce16ee0a-d026-44b4-8570-d699188601ba_0_">0.850023 0.093798 0.858911 0.139847 0.712741 0.247899 0.686888 0.110022 0.832297 0.001957 0.850023 0.093798</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_27d457b2-8705-4890-bfb6-48d16f217b01">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_27d457b2-8705-4890-bfb6-48d16f217b01_0_">0.847146 0.666318 0.821453 0.6858 0.804305 0.594826 0.829908 0.575342 0.847146 0.666318</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_56223c1d-263f-4cbc-8b97-0d02cfe26555">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_56223c1d-263f-4cbc-8b97-0d02cfe26555_0_">0.292437 0.712384 0.265753 0.708313 0.244618 0.592568 0.267296 0.575342 0.292437 0.712384</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_4eddb87e-af18-4326-abf4-9fdd7a8ba39b">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_4eddb87e-af18-4326-abf4-9fdd7a8ba39b_0_">0.350969 0.790645 0.325581 0.809928 0.317025 0.76488 0.342369 0.745597 0.350969 0.790645</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c06f02e6-1c09-4ec5-97f9-9c4e5677ee8c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c06f02e6-1c09-4ec5-97f9-9c4e5677ee8c_0_">0.279355 0.811558 0.245065 0.790605 0.242661 0.745597 0.276899 0.766548 0.279355 0.811558</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_8ac5c114-df7a-4da9-807e-bd9a3244b912">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_8ac5c114-df7a-4da9-807e-bd9a3244b912_0_">0.131268 0.740228 0.006801 0.666619 0.001957 0.575342 0.126046 0.648941 0.131268 0.740228</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_5a9f5c9d-d9f2-4194-b0a0-8a9cc7715db6">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_5a9f5c9d-d9f2-4194-b0a0-8a9cc7715db6_0_">0.448613 0.666548 0.392814 0.709443 0.375734 0.61824 0.431338 0.575342 0.448613 0.666548</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_882a1bad-1b7a-4d02-9b1d-9684ccef4c6d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_882a1bad-1b7a-4d02-9b1d-9684ccef4c6d_0_">0.706814 0.575342 0.74986 0.596727 0.73399 0.687877 0.690802 0.666496 0.706814 0.575342</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_af2cbfc4-310e-4882-bea8-5635f34ce694">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_af2cbfc4-310e-4882-bea8-5635f34ce694_0_">0.798961 0.666297 0.772181 0.687227 0.755382 0.596273 0.782069 0.575342 0.798961 0.666297</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_8c7cd584-500b-414b-bb91-e7aaed599f2c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_8c7cd584-500b-414b-bb91-e7aaed599f2c_0_">0.902689 0.203941 0.900029 0.206159 0.863014 0.004176 0.865653 0.001957 0.902689 0.203941</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_299d8a13-602f-42ed-af80-d8c290e80454">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_299d8a13-602f-42ed-af80-d8c290e80454_0_">0.411743 0.569347 0.408677 0.568006 0.395303 0.365949 0.398349 0.36729 0.411743 0.569347</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_e31d6d86-de90-4d01-aea5-ce3fdf9b8146">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_e31d6d86-de90-4d01-aea5-ce3fdf9b8146_0_">0.3904 0.569054 0.38713 0.568007 0.373777 0.365949 0.377026 0.366997 0.3904 0.569054</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_932ca762-6159-4ae3-ae03-b9c025070160">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_932ca762-6159-4ae3-ae03-b9c025070160_0_">0.233981 0.568747 0.230551 0.568007 0.217221 0.365949 0.220628 0.36669 0.233981 0.568747</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_ba60098f-8469-4822-ac9e-147281da12c9">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_ba60098f-8469-4822-ac9e-147281da12c9_0_">0.212542 0.56843 0.209002 0.568007 0.195695 0.365949 0.199212 0.366372 0.212542 0.56843</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_20e9ed1f-c3e0-4003-850a-c78ce6ad8f19">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_20e9ed1f-c3e0-4003-850a-c78ce6ad8f19_0_">0.191055 0.568106 0.187451 0.568007 0.174168 0.365949 0.177748 0.366048 0.191055 0.568106</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_fe8c8b90-811e-444b-a015-3a22bf822e98">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_fe8c8b90-811e-444b-a015-3a22bf822e98_0_">0.152642 0.366175 0.156234 0.365949 0.169517 0.568007 0.165901 0.568233 0.152642 0.366175</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_cd658293-2d3c-451b-81cd-fa56cebb1638">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_cd658293-2d3c-451b-81cd-fa56cebb1638_0_">0.238748 0.366497 0.242302 0.365949 0.255561 0.568007 0.251983 0.568555 0.238748 0.366497</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_754eff66-2ddf-459d-a77d-1080ccbd2959">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_754eff66-2ddf-459d-a77d-1080ccbd2959_0_">0.508806 0.366811 0.512274 0.365949 0.525509 0.568007 0.522018 0.568869 0.508806 0.366811</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_da33e42c-600d-4066-941a-64330f0a6142">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_da33e42c-600d-4066-941a-64330f0a6142_0_">0.573386 0.367114 0.576719 0.365949 0.58993 0.568007 0.586574 0.569171 0.573386 0.367114</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_96421f62-4fa8-43d8-9bf9-83e553627d5d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_96421f62-4fa8-43d8-9bf9-83e553627d5d_0_">0.473581 0.3674 0.476733 0.365949 0.489922 0.568007 0.486748 0.569457 0.473581 0.3674</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_ad03abb0-26c6-40e0-a238-8207f3d47caf">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_ad03abb0-26c6-40e0-a238-8207f3d47caf_0_">0.04501 0.367666 0.047937 0.365949 0.061105 0.568025 0.058157 0.569741 0.04501 0.367666</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_f8d40c40-6da0-4c82-8089-6981ea1e01a6">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_f8d40c40-6da0-4c82-8089-6981ea1e01a6_0_">0.144519 0.365949 0.147536 0.367872 0.112629 0.570321 0.109589 0.568399 0.144519 0.365949</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_15cea0b2-83de-434d-8d06-2475fcf9839e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_15cea0b2-83de-434d-8d06-2475fcf9839e_0_">0.036911 0.365949 0.040179 0.367633 0.005249 0.570082 0.001957 0.568399 0.036911 0.365949</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_12086a38-298b-409a-a780-598b8f6e89c9">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_12086a38-298b-409a-a780-598b8f6e89c9_0_">0.958657 0.001957 0.962132 0.003378 0.927178 0.205828 0.923679 0.204407 0.958657 0.001957</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d72cb65f-7be9-47c4-8eb4-78028fb17ef9">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d72cb65f-7be9-47c4-8eb4-78028fb17ef9_0_">0.10154 0.365949 0.105172 0.367088 0.070194 0.569539 0.066536 0.5684 0.10154 0.365949</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9aceb406-7741-4a1c-90a9-bf24733e4321">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9aceb406-7741-4a1c-90a9-bf24733e4321_0_">0.338356 0.365949 0.342096 0.36679 0.307093 0.569223 0.303327 0.568382 0.338356 0.365949</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9d0ea2f4-7e4b-425a-a544-0732d9cfc5fd">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9d0ea2f4-7e4b-425a-a544-0732d9cfc5fd_0_">0.295329 0.365949 0.299125 0.36648 0.264096 0.568913 0.260274 0.568382 0.295329 0.365949</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_252aae15-90e2-438f-864a-c51cc2f3f969">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_252aae15-90e2-438f-864a-c51cc2f3f969_0_">0.565413 0.365949 0.569213 0.366163 0.534157 0.568596 0.530333 0.568382 0.565413 0.365949</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_08afd4a0-abab-4f34-903b-0772fced28a7">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_08afd4a0-abab-4f34-903b-0772fced28a7_0_">0.352016 0.366063 0.3552 0.365949 0.349584 0.56771 0.34638 0.567825 0.352016 0.366063</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_b9243d00-87f7-4c13-83a3-b5b5ffbf1ed9">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_b9243d00-87f7-4c13-83a3-b5b5ffbf1ed9_0_">0.365735 0.366361 0.368871 0.365949 0.363235 0.56771 0.360078 0.568122 0.365735 0.366361</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_608f3208-63d0-4ccb-af16-040a60baf076">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_608f3208-63d0-4ccb-af16-040a60baf076_0_">0.422506 0.366653 0.425551 0.365949 0.419894 0.56771 0.41683 0.568414 0.422506 0.366653</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_51dc6d03-9ee6-429b-8f39-d1cc25cb0045">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_51dc6d03-9ee6-429b-8f39-d1cc25cb0045_0_">0.436223 0.366935 0.439135 0.365949 0.433458 0.56771 0.430528 0.568695 0.436223 0.366935</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_1efa6be5-b9d5-4bc7-a9fb-a7ee0f847a30">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_1efa6be5-b9d5-4bc7-a9fb-a7ee0f847a30_0_">0.465595 0.367203 0.468332 0.365949 0.462637 0.567709 0.459883 0.568963 0.465595 0.367203</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_42ba4aa2-7e77-42ba-b5ad-a6ea901eb4ae">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_42ba4aa2-7e77-42ba-b5ad-a6ea901eb4ae_0_">0.500836 0.367454 0.503362 0.365949 0.497649 0.567709 0.495108 0.569213 0.500836 0.367454</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_e89c3674-d764-49c0-9384-643eec7842e8">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_e89c3674-d764-49c0-9384-643eec7842e8_0_">0.916037 0.001957 0.918407 0.003935 0.91041 0.205644 0.908023 0.203666 0.916037 0.001957</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_994ac017-7975-457d-90d7-6f3ecd6559da">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_994ac017-7975-457d-90d7-6f3ecd6559da_0_">0.596869 0.765 0.597007 0.745597 0.622673 0.781328 0.596869 0.765</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_421635b1-490c-4a7c-9f3f-de2032dcfe1a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_421635b1-490c-4a7c-9f3f-de2032dcfe1a_0_">0.592411 0.765177 0.571429 0.781228 0.588664 0.745597 0.592411 0.765177</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_5119aef9-e09c-43c4-97bc-04277a328351">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_5119aef9-e09c-43c4-97bc-04277a328351_0_">0.788994 0.749336 0.76697 0.765136 0.763209 0.745597 0.788994 0.749336</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_53ef3363-f419-413e-b931-c2a6edd5faf2">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_53ef3363-f419-413e-b931-c2a6edd5faf2_0_">0.700587 0.749778 0.727169 0.745597 0.727212 0.765742 0.700587 0.749778</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d582e0c1-e710-4c25-ad64-a2cf3489eefb">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d582e0c1-e710-4c25-ad64-a2cf3489eefb_0_">0.757775 0.750002 0.735905 0.766083 0.731898 0.745597 0.757775 0.750002</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_bee56d85-96ba-4c16-8b43-f0475a1337ef">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_bee56d85-96ba-4c16-8b43-f0475a1337ef_0_">0.794521 0.750176 0.821369 0.745597 0.821493 0.765122 0.794521 0.750176</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d3bf2852-a4bc-4885-8a25-738b1120bbc1">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d3bf2852-a4bc-4885-8a25-738b1120bbc1_0_">0.137011 0.575342 0.239 0.63918 0.239325 0.729653 0.136986 0.665773 0.137011 0.575342</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_f73d2305-2cc6-43f7-982d-fc7c854f5c3c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_f73d2305-2cc6-43f7-982d-fc7c854f5c3c_0_">0.448614 0.457467 0.452258 0.365949 0.454894 0.367699 0.446881 0.56939 0.444227 0.567641 0.448614 0.457467</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
            </app:ParameterizedTexture>
          </app:surfaceDataMember>
        </app:Appearance>
      </app:appearance>
      <bldg:yearOfConstruction>1981</bldg:yearOfConstruction>
      <bldg:lod1Solid>
        <gml:Solid gml:id="ID_ee110164-311e-4194-98c5-0cf36b35e86c">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_8091a95f-1eac-4cd8-bee8-9eba00c9c72c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_06bd1759-6823-4fb8-b9ee-8eefa6ad1255">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_06bd1759-6823-4fb8-b9ee-8eefa6ad1255_0_">
                      <gml:posList srsDimension="3">92915.67 436643.54 2.52000000000002 92911.28 436640.0 2.52000000000002 92911.28 436640.0 16.940625 92915.67 436643.54 16.940625 92915.67 436643.54 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_bdb48ebb-a67f-4b56-878e-e1d1be860f31">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_bdb48ebb-a67f-4b56-878e-e1d1be860f31_0_">
                      <gml:posList srsDimension="3">92911.28 436640.0 2.52000000000002 92911.1631654626 436640.135183909 2.52000000000002 92911.1631654626 436640.135183909 16.940625 92911.28 436640.0 16.940625 92911.28 436640.0 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f2469c6e-11f2-4a2d-9b08-9075fd459fa2">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f2469c6e-11f2-4a2d-9b08-9075fd459fa2_0_">
                      <gml:posList srsDimension="3">92911.1631654626 436640.135183909 2.52000000000002 92911.0312729559 436640.255721725 2.52000000000002 92911.0312729559 436640.255721725 16.940625 92911.1631654626 436640.135183909 16.940625 92911.1631654626 436640.135183909 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_736f1e59-e34d-47fc-92ff-45a933ddac57">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_736f1e59-e34d-47fc-92ff-45a933ddac57_0_">
                      <gml:posList srsDimension="3">92911.0312729559 436640.255721725 2.52000000000002 92910.8861454286 436640.359947438 2.52000000000002 92910.8861454286 436640.359947438 16.940625 92911.0312729559 436640.255721725 16.940625 92911.0312729559 436640.255721725 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c45c0256-214b-4ee1-b68b-5edde411e5fb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c45c0256-214b-4ee1-b68b-5edde411e5fb_0_">
                      <gml:posList srsDimension="3">92910.8861454286 436640.359947438 2.52000000000002 92910.7297887567 436640.446420496 2.52000000000002 92910.7297887567 436640.446420496 16.940625 92910.8861454286 436640.359947438 16.940625 92910.8861454286 436640.359947438 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0c81a46a-00ba-4d8c-9dc4-ec31cd10e600">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0c81a46a-00ba-4d8c-9dc4-ec31cd10e600_0_">
                      <gml:posList srsDimension="3">92910.7297887567 436640.446420496 2.52000000000002 92910.5643640197 436640.513945712 2.52000000000002 92910.5643640197 436640.513945712 16.940625 92910.7297887567 436640.446420496 16.940625 92910.7297887567 436640.446420496 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e6114646-48ba-4fe3-a882-07cb8e38328e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e6114646-48ba-4fe3-a882-07cb8e38328e_0_">
                      <gml:posList srsDimension="3">92910.5643640197 436640.513945712 2.52000000000002 92910.3921576309 436640.561589789 2.52000000000002 92910.3921576309 436640.561589789 16.940625 92910.5643640197 436640.513945712 16.940625 92910.5643640197 436640.513945712 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_cae4b7ee-6000-4681-ab5a-2fe149deed51">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_cae4b7ee-6000-4681-ab5a-2fe149deed51_0_">
                      <gml:posList srsDimension="3">92910.3921576309 436640.561589789 2.52000000000002 92910.2155497362 436640.588694217 2.52000000000002 92910.2155497362 436640.588694217 16.940625 92910.3921576309 436640.561589789 16.940625 92910.3921576309 436640.561589789 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_61f6978c-b932-42ce-80d8-5a9320741ab6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_61f6978c-b932-42ce-80d8-5a9320741ab6_0_">
                      <gml:posList srsDimension="3">92910.2155497362 436640.588694217 2.52000000000002 92910.0369813168 436640.594884371 2.52000000000002 92910.0369813168 436640.594884371 16.940625 92910.2155497362 436640.588694217 16.940625 92910.2155497362 436640.588694217 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d2693f74-a124-4d0a-83bc-8405a2c33025">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d2693f74-a124-4d0a-83bc-8405a2c33025_0_">
                      <gml:posList srsDimension="3">92910.0369813168 436640.594884371 2.52000000000002 92909.8589204509 436640.580074695 2.52000000000002 92909.8589204509 436640.580074695 16.940625 92910.0369813168 436640.594884371 16.940625 92910.0369813168 436640.594884371 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1939f43e-998f-495a-9905-72aaf59215bc">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1939f43e-998f-495a-9905-72aaf59215bc_0_">
                      <gml:posList srsDimension="3">92909.8589204509 436640.580074695 2.52000000000002 92909.683828202 436640.544469881 2.52000000000002 92909.683828202 436640.544469881 16.940625 92909.8589204509 436640.580074695 16.940625 92909.8589204509 436640.580074695 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e3fbe55d-fb64-4b0e-a3fe-6f946d76f608">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e3fbe55d-fb64-4b0e-a3fe-6f946d76f608_0_">
                      <gml:posList srsDimension="3">92909.683828202 436640.544469881 2.52000000000002 92909.5141246027 436640.488562038 2.52000000000002 92909.5141246027 436640.488562038 16.940625 92909.683828202 436640.544469881 16.940625 92909.683828202 436640.544469881 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_cee3918f-8809-42ff-ac33-badaedb99f78">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_cee3918f-8809-42ff-ac33-badaedb99f78_0_">
                      <gml:posList srsDimension="3">92909.5141246027 436640.488562038 2.52000000000002 92909.3521552066 436640.413123897 2.52000000000002 92909.3521552066 436640.413123897 16.940625 92909.5141246027 436640.488562038 16.940625 92909.5141246027 436640.488562038 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_eee2f4cc-b2b5-4c7f-b9f0-e2663fda00f2">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_eee2f4cc-b2b5-4c7f-b9f0-e2663fda00f2_0_">
                      <gml:posList srsDimension="3">92909.3521552066 436640.413123897 2.52000000000002 92909.2001586691 436640.319198123 2.52000000000002 92909.2001586691 436640.319198123 16.940625 92909.3521552066 436640.413123897 16.940625 92909.3521552066 436640.413123897 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6638da7c-a320-472b-83d1-5ed1677eef76">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6638da7c-a320-472b-83d1-5ed1677eef76_0_">
                      <gml:posList srsDimension="3">92909.2001586691 436640.319198123 2.52000000000002 92909.0602358063 436640.208082908 2.52000000000002 92909.0602358063 436640.208082908 16.940625 92909.2001586691 436640.319198123 16.940625 92909.2001586691 436640.319198123 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f3083d40-5f91-44a0-845a-56f3c449985a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f3083d40-5f91-44a0-845a-56f3c449985a_0_">
                      <gml:posList srsDimension="3">92909.0602358063 436640.208082908 2.52000000000002 92908.9343205581 436640.081314029 2.52000000000002 92908.9343205581 436640.081314029 16.940625 92909.0602358063 436640.208082908 16.940625 92909.0602358063 436640.208082908 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0f6d2c5c-7559-4eae-82be-a63f06c30203">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0f6d2c5c-7559-4eae-82be-a63f06c30203_0_">
                      <gml:posList srsDimension="3">92908.9343205581 436640.081314029 2.52000000000002 92908.8241532585 436639.940643618 2.52000000000002 92908.8241532585 436639.940643618 16.940625 92908.9343205581 436640.081314029 16.940625 92908.9343205581 436640.081314029 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a7583dc9-47cc-4694-95cd-43eb1dbf8871">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a7583dc9-47cc-4694-95cd-43eb1dbf8871_0_">
                      <gml:posList srsDimension="3">92908.8241532585 436639.940643618 2.52000000000002 92908.7312565819 436639.788015947 2.52000000000002 92908.7312565819 436639.788015947 16.940625 92908.8241532585 436639.940643618 16.940625 92908.8241532585 436639.940643618 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9b4bb0d1-85fe-4f72-9342-877e52f07f2c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9b4bb0d1-85fe-4f72-9342-877e52f07f2c_0_">
                      <gml:posList srsDimension="3">92908.7312565819 436639.788015947 2.52000000000002 92908.6569144972 436639.625540555 2.52000000000002 92908.6569144972 436639.625540555 16.940625 92908.7312565819 436639.788015947 16.940625 92908.7312565819 436639.788015947 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_07b28a90-d6ed-4dfb-9419-54640444d81c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_07b28a90-d6ed-4dfb-9419-54640444d81c_0_">
                      <gml:posList srsDimension="3">92908.6569144972 436639.625540555 2.52000000000002 92908.6021545211 436639.455463092 2.52000000000002 92908.6021545211 436639.455463092 16.940625 92908.6569144972 436639.625540555 16.940625 92908.6569144972 436639.625540555 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a298a77c-9054-40af-951e-9d07cc0ce515">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a298a77c-9054-40af-951e-9d07cc0ce515_0_">
                      <gml:posList srsDimension="3">92908.6021545211 436639.455463092 2.52000000000002 92908.5677335175 436639.280134278 2.52000000000002 92908.5677335175 436639.280134278 16.940625 92908.6021545211 436639.455463092 16.940625 92908.6021545211 436639.455463092 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_47bbc0ef-721e-45de-85af-2f5b61bdd537">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_47bbc0ef-721e-45de-85af-2f5b61bdd537_0_">
                      <gml:posList srsDimension="3">92908.5677335175 436639.280134278 2.52000000000002 92908.5541272352 436639.101977416 2.52000000000002 92908.5541272352 436639.101977416 16.940625 92908.5677335175 436639.280134278 16.940625 92908.5677335175 436639.280134278 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2d1085d9-fdf3-4a72-b539-9ae87a206895">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2d1085d9-fdf3-4a72-b539-9ae87a206895_0_">
                      <gml:posList srsDimension="3">92908.5615237329 436638.923454896 16.940625 92908.5541272352 436639.101977416 16.940625 92908.5541272352 436639.101977416 2.52000000000002 92908.5615237329 436638.923454896 2.52000000000002 92908.5615237329 436638.923454896 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2fa45a6c-f659-475d-9a68-cd21dbc952d5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2fa45a6c-f659-475d-9a68-cd21dbc952d5_0_">
                      <gml:posList srsDimension="3">92908.5898207803 436638.747034161 16.940625 92908.5615237329 436638.923454896 16.940625 92908.5615237329 436638.923454896 2.52000000000002 92908.5898207803 436638.747034161 2.52000000000002 92908.5898207803 436638.747034161 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_dbc70f46-4f92-4af5-adba-a9afb53a38f9">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_dbc70f46-4f92-4af5-adba-a9afb53a38f9_0_">
                      <gml:posList srsDimension="3">92908.6386272706 436638.575153607 16.940625 92908.5898207803 436638.747034161 16.940625 92908.5898207803 436638.747034161 2.52000000000002 92908.6386272706 436638.575153607 2.52000000000002 92908.6386272706 436638.575153607 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2b7aa290-8266-4664-a2b7-0c6c446c6b2b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2b7aa290-8266-4664-a2b7-0c6c446c6b2b_0_">
                      <gml:posList srsDimension="3">92908.707268626 436638.410188875 16.940625 92908.6386272706 436638.575153607 16.940625 92908.6386272706 436638.575153607 2.52000000000002 92908.707268626 436638.410188875 2.52000000000002 92908.707268626 436638.410188875 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_67d00cc2-6c54-4b66-9552-001788a40be6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_67d00cc2-6c54-4b66-9552-001788a40be6_0_">
                      <gml:posList srsDimension="3">92908.7947961221 436638.254420021 16.940625 92908.707268626 436638.410188875 16.940625 92908.707268626 436638.410188875 2.52000000000002 92908.7947961221 436638.254420021 2.52000000000002 92908.7947961221 436638.254420021 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_805adfb5-d1cd-46ef-84a9-4fb8045b3689">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_805adfb5-d1cd-46ef-84a9-4fb8045b3689_0_">
                      <gml:posList srsDimension="3">92908.9 436638.11 16.940625 92908.7947961221 436638.254420021 16.940625 92908.7947961221 436638.254420021 2.52000000000002 92908.9 436638.11 2.52000000000002 92908.9 436638.11 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a47db387-9bf4-4a51-b6fc-b0d18960c3fe">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a47db387-9bf4-4a51-b6fc-b0d18960c3fe_0_">
                      <gml:posList srsDimension="3">92908.9 436638.11 2.52000000000002 92907.49 436637.01 2.52000000000002 92907.49 436637.01 16.940625 92908.9 436638.11 16.940625 92908.9 436638.11 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_87c0e02e-9372-47ab-8100-4a4f779c50ee">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_87c0e02e-9372-47ab-8100-4a4f779c50ee_0_">
                      <gml:posList srsDimension="3">92907.49 436637.01 2.52000000000002 92903.7 436634.04 2.52000000000002 92903.7 436634.04 16.940625 92907.49 436637.01 16.940625 92907.49 436637.01 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4332703b-e5cb-4894-b483-973423745a90">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4332703b-e5cb-4894-b483-973423745a90_0_">
                      <gml:posList srsDimension="3">92911.27 436624.7 16.940625 92903.7 436634.04 16.940625 92903.7 436634.04 2.52000000000002 92911.27 436624.7 2.52000000000002 92911.27 436624.7 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8de423cc-3b63-4d69-9a73-33f44b84bdd9">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8de423cc-3b63-4d69-9a73-33f44b84bdd9_0_">
                      <gml:posList srsDimension="3">92923.21 436634.29 16.940625 92911.27 436624.7 16.940625 92911.27 436624.7 2.52000000000002 92923.21 436634.29 2.52000000000002 92923.21 436634.29 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b14a4c95-3449-4bf7-b4fc-ba3d71502abc">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b14a4c95-3449-4bf7-b4fc-ba3d71502abc_0_">
                      <gml:posList srsDimension="3">92923.21 436634.29 2.52000000000002 92922.89 436634.67 2.52000000000002 92922.89 436634.67 16.940625 92923.21 436634.29 16.940625 92923.21 436634.29 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9e33988f-47e5-4f83-9503-30560c1abccf">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9e33988f-47e5-4f83-9503-30560c1abccf_0_">
                      <gml:posList srsDimension="3">92922.89 436634.67 2.52000000000002 92915.67 436643.54 2.52000000000002 92915.67 436643.54 16.940625 92922.89 436634.67 16.940625 92922.89 436634.67 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_589f9c0b-82bf-4a5d-8036-20c92d4dc4d3">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_589f9c0b-82bf-4a5d-8036-20c92d4dc4d3_0_">
                      <gml:posList srsDimension="3">92909.3521552066 436640.413123897 16.940625 92909.2001586691 436640.319198123 16.940625 92909.0602358063 436640.208082908 16.940625 92908.9343205581 436640.081314029 16.940625 92908.8241532585 436639.940643618 16.940625 92908.7312565819 436639.788015947 16.940625 92908.6569144972 436639.625540555 16.940625 92908.6021545211 436639.455463092 16.940625 92908.5677335175 436639.280134278 16.940625 92908.5541272352 436639.101977416 16.940625 92908.5615237329 436638.923454896 16.940625 92908.5898207803 436638.747034161 16.940625 92908.6386272706 436638.575153607 16.940625 92908.707268626 436638.410188875 16.940625 92908.7947961221 436638.254420021 16.940625 92908.9 436638.11 16.940625 92907.49 436637.01 16.940625 92903.7 436634.04 16.940625 92911.27 436624.7 16.940625 92923.21 436634.29 16.940625 92922.89 436634.67 16.940625 92915.67 436643.54 16.940625 92911.28 436640.0 16.940625 92911.1631654626 436640.135183909 16.940625 92911.0312729559 436640.255721725 16.940625 92910.8861454286 436640.359947438 16.940625 92910.7297887567 436640.446420496 16.940625 92910.5643640197 436640.513945712 16.940625 92910.3921576309 436640.561589789 16.940625 92910.2155497362 436640.588694217 16.940625 92910.0369813168 436640.594884371 16.940625 92909.8589204509 436640.580074695 16.940625 92909.683828202 436640.544469881 16.940625 92909.5141246027 436640.488562038 16.940625 92909.3521552066 436640.413123897 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_74f395f4-c232-47c3-808c-a9f6a0d579d4">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_74f395f4-c232-47c3-808c-a9f6a0d579d4_0_">
                      <gml:posList srsDimension="3">92909.5141246027 436640.488562038 2.52000000000002 92909.683828202 436640.544469881 2.52000000000002 92909.8589204509 436640.580074695 2.52000000000002 92910.0369813168 436640.594884371 2.52000000000002 92910.2155497362 436640.588694217 2.52000000000002 92910.3921576309 436640.561589789 2.52000000000002 92910.5643640197 436640.513945712 2.52000000000002 92910.7297887567 436640.446420496 2.52000000000002 92910.8861454286 436640.359947438 2.52000000000002 92911.0312729559 436640.255721725 2.52000000000002 92911.1631654626 436640.135183909 2.52000000000002 92911.28 436640.0 2.52000000000002 92915.67 436643.54 2.52000000000002 92922.89 436634.67 2.52000000000002 92923.21 436634.29 2.52000000000002 92911.27 436624.7 2.52000000000002 92903.7 436634.04 2.52000000000002 92907.49 436637.01 2.52000000000002 92908.9 436638.11 2.52000000000002 92908.7947961221 436638.254420021 2.52000000000002 92908.707268626 436638.410188875 2.52000000000002 92908.6386272706 436638.575153607 2.52000000000002 92908.5898207803 436638.747034161 2.52000000000002 92908.5615237329 436638.923454896 2.52000000000002 92908.5541272352 436639.101977416 2.52000000000002 92908.5677335175 436639.280134278 2.52000000000002 92908.6021545211 436639.455463092 2.52000000000002 92908.6569144972 436639.625540555 2.52000000000002 92908.7312565819 436639.788015947 2.52000000000002 92908.8241532585 436639.940643618 2.52000000000002 92908.9343205581 436640.081314029 2.52000000000002 92909.0602358063 436640.208082908 2.52000000000002 92909.2001586691 436640.319198123 2.52000000000002 92909.3521552066 436640.413123897 2.52000000000002 92909.5141246027 436640.488562038 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod1Solid>
      <bldg:lod2Solid>
        <gml:Solid gml:id="UUID_769f3b55-c761-430e-a0a9-ad9e6d183e09">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_a1dbec50-183f-4063-bf62-42e7ce0cf5c6">
              <gml:surfaceMember xlink:href="#RCID_a70c8bbf-b377-470f-8c7a-c7e014e50f89"/>
              <gml:surfaceMember xlink:href="#RCID_0867a2d3-0e1d-4fc2-85ff-a38f1f3df283"/>
              <gml:surfaceMember xlink:href="#RCID_c21f3fe5-60e4-4c00-9f17-4bc498b117ba"/>
              <gml:surfaceMember xlink:href="#RCID_5f56fb00-2544-4ab8-95d2-d2773e9ada4c"/>
              <gml:surfaceMember xlink:href="#RCID_ecdae91e-4da3-45c5-b629-3ec98971eef7"/>
              <gml:surfaceMember xlink:href="#RCID_49e5f7f2-f5cd-406a-b12e-5ce95a6a0dba"/>
              <gml:surfaceMember xlink:href="#RCID_9213f60c-31c1-42c0-aae9-20bb5982e5fb"/>
              <gml:surfaceMember xlink:href="#RCID_8b448d66-c148-4e08-89e7-cf23bc735f0a"/>
              <gml:surfaceMember xlink:href="#RCID_30704ec4-2fa8-46c8-9509-052ed53f54c6"/>
              <gml:surfaceMember xlink:href="#RCID_8b31e72c-8d7b-4460-a096-912ea66308a2"/>
              <gml:surfaceMember xlink:href="#RCID_955277dc-2074-41ad-a59b-dd7a9aad4498"/>
              <gml:surfaceMember xlink:href="#RCID_b37365bd-6881-442a-976e-07d306084b4d"/>
              <gml:surfaceMember xlink:href="#RCID_2d50d579-7251-4a46-9434-f1be04fe2a5c"/>
              <gml:surfaceMember xlink:href="#RCID_f53fc387-57e2-4d64-bd43-e7b316cff5e5"/>
              <gml:surfaceMember xlink:href="#RCID_2b21aaf5-5102-4740-87fc-3dbbadfe381e"/>
              <gml:surfaceMember xlink:href="#RCID_5fc01134-58a9-4b6c-962b-dcdd73cdcf76"/>
              <gml:surfaceMember xlink:href="#RCID_0c876cdc-0f3d-44d8-9f3d-fd47c12c2879"/>
              <gml:surfaceMember xlink:href="#RCID_c949ada8-5415-4524-b50f-6757f87c7973"/>
              <gml:surfaceMember xlink:href="#RCID_a8070fb9-5cee-488e-a180-21d13593fa04"/>
              <gml:surfaceMember xlink:href="#RCID_503e5d6d-9d36-4245-a236-7addbc03ed06"/>
              <gml:surfaceMember xlink:href="#RCID_7b8a6d4c-79ee-4dd3-a18f-64e4b7f14ee3"/>
              <gml:surfaceMember xlink:href="#RCID_860cf8ce-9dbd-414d-96d4-1f1cd64b354d"/>
              <gml:surfaceMember xlink:href="#RCID_7194a724-ecc9-4f54-b057-97a7cda82250"/>
              <gml:surfaceMember xlink:href="#RCID_699ead19-ebff-464d-b0de-ebbcdc76ce8b"/>
              <gml:surfaceMember xlink:href="#RCID_a6332cc6-6b6b-406f-9ff9-2776ae446537"/>
              <gml:surfaceMember xlink:href="#RCID_c11f803f-9907-4098-a61b-3f188703b8e3"/>
              <gml:surfaceMember xlink:href="#RCID_ce959514-734f-40cc-bb2a-0c68d6197a7b"/>
              <gml:surfaceMember xlink:href="#RCID_09c29441-77f1-4be2-bd83-feed6a91014e"/>
              <gml:surfaceMember xlink:href="#RCID_338328a9-cc25-4b15-84e5-43671a342d82"/>
              <gml:surfaceMember xlink:href="#RCID_ce16ee0a-d026-44b4-8570-d699188601ba"/>
              <gml:surfaceMember xlink:href="#RCID_27d457b2-8705-4890-bfb6-48d16f217b01"/>
              <gml:surfaceMember xlink:href="#RCID_56223c1d-263f-4cbc-8b97-0d02cfe26555"/>
              <gml:surfaceMember xlink:href="#RCID_4eddb87e-af18-4326-abf4-9fdd7a8ba39b"/>
              <gml:surfaceMember xlink:href="#RCID_c06f02e6-1c09-4ec5-97f9-9c4e5677ee8c"/>
              <gml:surfaceMember xlink:href="#RCID_8ac5c114-df7a-4da9-807e-bd9a3244b912"/>
              <gml:surfaceMember xlink:href="#RCID_5a9f5c9d-d9f2-4194-b0a0-8a9cc7715db6"/>
              <gml:surfaceMember xlink:href="#RCID_882a1bad-1b7a-4d02-9b1d-9684ccef4c6d"/>
              <gml:surfaceMember xlink:href="#RCID_af2cbfc4-310e-4882-bea8-5635f34ce694"/>
              <gml:surfaceMember xlink:href="#RCID_8c7cd584-500b-414b-bb91-e7aaed599f2c"/>
              <gml:surfaceMember xlink:href="#RCID_299d8a13-602f-42ed-af80-d8c290e80454"/>
              <gml:surfaceMember xlink:href="#RCID_e31d6d86-de90-4d01-aea5-ce3fdf9b8146"/>
              <gml:surfaceMember xlink:href="#RCID_932ca762-6159-4ae3-ae03-b9c025070160"/>
              <gml:surfaceMember xlink:href="#RCID_ba60098f-8469-4822-ac9e-147281da12c9"/>
              <gml:surfaceMember xlink:href="#RCID_20e9ed1f-c3e0-4003-850a-c78ce6ad8f19"/>
              <gml:surfaceMember xlink:href="#RCID_fe8c8b90-811e-444b-a015-3a22bf822e98"/>
              <gml:surfaceMember xlink:href="#RCID_cd658293-2d3c-451b-81cd-fa56cebb1638"/>
              <gml:surfaceMember xlink:href="#RCID_754eff66-2ddf-459d-a77d-1080ccbd2959"/>
              <gml:surfaceMember xlink:href="#RCID_da33e42c-600d-4066-941a-64330f0a6142"/>
              <gml:surfaceMember xlink:href="#RCID_96421f62-4fa8-43d8-9bf9-83e553627d5d"/>
              <gml:surfaceMember xlink:href="#RCID_ad03abb0-26c6-40e0-a238-8207f3d47caf"/>
              <gml:surfaceMember xlink:href="#RCID_f8d40c40-6da0-4c82-8089-6981ea1e01a6"/>
              <gml:surfaceMember xlink:href="#RCID_15cea0b2-83de-434d-8d06-2475fcf9839e"/>
              <gml:surfaceMember xlink:href="#RCID_12086a38-298b-409a-a780-598b8f6e89c9"/>
              <gml:surfaceMember xlink:href="#RCID_d72cb65f-7be9-47c4-8eb4-78028fb17ef9"/>
              <gml:surfaceMember xlink:href="#RCID_9aceb406-7741-4a1c-90a9-bf24733e4321"/>
              <gml:surfaceMember xlink:href="#RCID_9d0ea2f4-7e4b-425a-a544-0732d9cfc5fd"/>
              <gml:surfaceMember xlink:href="#RCID_252aae15-90e2-438f-864a-c51cc2f3f969"/>
              <gml:surfaceMember xlink:href="#RCID_08afd4a0-abab-4f34-903b-0772fced28a7"/>
              <gml:surfaceMember xlink:href="#RCID_b9243d00-87f7-4c13-83a3-b5b5ffbf1ed9"/>
              <gml:surfaceMember xlink:href="#RCID_608f3208-63d0-4ccb-af16-040a60baf076"/>
              <gml:surfaceMember xlink:href="#RCID_51dc6d03-9ee6-429b-8f39-d1cc25cb0045"/>
              <gml:surfaceMember xlink:href="#RCID_1efa6be5-b9d5-4bc7-a9fb-a7ee0f847a30"/>
              <gml:surfaceMember xlink:href="#RCID_42ba4aa2-7e77-42ba-b5ad-a6ea901eb4ae"/>
              <gml:surfaceMember xlink:href="#RCID_e89c3674-d764-49c0-9384-643eec7842e8"/>
              <gml:surfaceMember xlink:href="#RCID_994ac017-7975-457d-90d7-6f3ecd6559da"/>
              <gml:surfaceMember xlink:href="#RCID_421635b1-490c-4a7c-9f3f-de2032dcfe1a"/>
              <gml:surfaceMember xlink:href="#RCID_5119aef9-e09c-43c4-97bc-04277a328351"/>
              <gml:surfaceMember xlink:href="#RCID_53ef3363-f419-413e-b931-c2a6edd5faf2"/>
              <gml:surfaceMember xlink:href="#RCID_d582e0c1-e710-4c25-ad64-a2cf3489eefb"/>
              <gml:surfaceMember xlink:href="#RCID_bee56d85-96ba-4c16-8b43-f0475a1337ef"/>
              <gml:surfaceMember xlink:href="#RCID_d3bf2852-a4bc-4885-8a25-738b1120bbc1"/>
              <gml:surfaceMember xlink:href="#RCID_f73d2305-2cc6-43f7-982d-fc7c854f5c3c"/>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod2Solid>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_fbe24f9a-9425-4741-9835-9f8f01b8e8db">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_6b46618e-206f-4189-be39-a46d6b891397">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c21f3fe5-60e4-4c00-9f17-4bc498b117ba">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c21f3fe5-60e4-4c00-9f17-4bc498b117ba_0_">
                      <gml:posList srsDimension="3">92922.8900000006 436634.670000002 14.0671875 92922.2371505127 436635.472046392 14.0671875 92919.7048466431 436633.410802431 14.0671875 92920.6577761059 436632.240098229 14.0671875 92923.2100000009 436634.289999999 14.0671875 92922.8900000006 436634.670000002 14.0671875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_020a0eaa-0875-4507-a283-26904de24108">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_22cb600e-4295-4dd0-8f55-cf2ffa04c444">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0867a2d3-0e1d-4fc2-85ff-a38f1f3df283">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0867a2d3-0e1d-4fc2-85ff-a38f1f3df283_0_">
                      <gml:posList srsDimension="3">92916.6966020969 436630.836007071 16.940625 92915.1378105462 436629.584012853 16.940625 92916.0056111505 436628.50356038 15.6656249999063 92917.5644027011 436629.755554598 15.665625 92916.6966020969 436630.836007071 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:GroundSurface gml:id="UUID_342acf2a-64af-41dc-9b3c-45812aa4df72">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_16dce861-ab2e-444c-81e0-6f5fa7e536f0">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a70c8bbf-b377-470f-8c7a-c7e014e50f89">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a70c8bbf-b377-470f-8c7a-c7e014e50f89_0_">
                      <gml:posList srsDimension="3">92909.2001586691 436640.319198123 2.52000000000002 92909.3521552066 436640.413123897 2.52000000000002 92909.5141246027 436640.488562038 2.52000000000002 92909.683828202 436640.544469881 2.52000000000002 92909.8589204509 436640.580074695 2.52000000000002 92910.0369813168 436640.594884371 2.52000000000002 92910.2155497362 436640.588694217 2.52000000000002 92910.3921576309 436640.561589789 2.52000000000002 92910.5643640197 436640.513945712 2.52000000000002 92910.7297887567 436640.446420496 2.52000000000002 92910.8861454286 436640.359947438 2.52000000000002 92911.0312729559 436640.255721725 2.52000000000002 92911.1631654626 436640.135183909 2.52000000000002 92911.2800000012 436640.0 2.52000000000002 92914.5599999987 436635.879999999 2.52000000000002 92908.9299999997 436631.420000002 2.52000000000002 92906.7399999983 436634.210000001 2.52000000000002 92908.5599999987 436635.64 2.52000000000002 92907.4899999983 436637.010000002 2.52000000000002 92908.9 436638.11 2.52000000000002 92908.7947961221 436638.254420021 2.52000000000002 92908.707268626 436638.410188875 2.52000000000002 92908.6386272706 436638.575153607 2.52000000000002 92908.5898207803 436638.747034161 2.52000000000002 92908.5615237329 436638.923454896 2.52000000000002 92908.5541272352 436639.101977416 2.52000000000002 92908.5677335175 436639.280134278 2.52000000000002 92908.6021545211 436639.455463092 2.52000000000002 92908.6569144972 436639.625540555 2.52000000000002 92908.7312565819 436639.788015947 2.52000000000002 92908.8241532585 436639.940643618 2.52000000000002 92908.9343205581 436640.081314029 2.52000000000002 92909.0602358063 436640.208082908 2.52000000000002 92909.2001586691 436640.319198123 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:GroundSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_1d582928-027e-4074-836b-5c7f343afbe4">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e4714d53-46a8-49c4-b81b-bf229557d44c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d3bf2852-a4bc-4885-8a25-738b1120bbc1">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d3bf2852-a4bc-4885-8a25-738b1120bbc1_0_">
                      <gml:posList srsDimension="3">92914.5599999987 436635.879999999 2.52000000000002 92911.2800000012 436640.0 2.52000000000002 92911.2800000012 436640.0 8.31000000000003 92914.5599999987 436635.879999999 8.31000000000003 92914.5599999987 436635.879999999 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_bce001e1-4c27-45c6-93ef-31cb42657078">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_82c90b4a-462f-4286-b3d3-3171d1eb42ba">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f73d2305-2cc6-43f7-982d-fc7c854f5c3c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f73d2305-2cc6-43f7-982d-fc7c854f5c3c_0_">
                      <gml:posList srsDimension="3">92911.2800000012 436640.0 8.31000000000003 92911.2800000012 436640.0 2.52000000000002 92911.1631654626 436640.135183909 2.52000000000002 92911.1631654626 436640.135183909 15.234375 92911.28 436640.0 15.234375 92911.2800000012 436640.0 8.31000000000003</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_8bea5b05-e40a-4d8d-8cf1-25ce0a8291f1">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_1efb56b4-9a90-4c9e-b32c-578d02341516">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_754eff66-2ddf-459d-a77d-1080ccbd2959">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_754eff66-2ddf-459d-a77d-1080ccbd2959_0_">
                      <gml:posList srsDimension="3">92908.6569144972 436639.625540555 2.52000000000002 92908.6021545211 436639.455463092 2.52000000000002 92908.6021545211 436639.455463092 15.234375 92908.6569144972 436639.625540555 15.234375 92908.6569144972 436639.625540555 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_1b08186c-1c1e-45c5-8624-766ac047a9af">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_1c116fe4-7c16-4015-a97e-e7ff9e9a6e7f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d582e0c1-e710-4c25-ad64-a2cf3489eefb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d582e0c1-e710-4c25-ad64-a2cf3489eefb_0_">
                      <gml:posList srsDimension="3">92912.9971597719 436639.530731215 16.940625 92912.1037071184 436640.664219408 16.940625 92912.1037071184 436640.664219408 15.5578125 92912.9971597719 436639.530731215 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_a2869fd4-13ae-4459-9b3f-d713b41983e7">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c8216dab-64d6-4fed-b312-dd448e4d8936">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_53ef3363-f419-413e-b931-c2a6edd5faf2">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_53ef3363-f419-413e-b931-c2a6edd5faf2_0_">
                      <gml:posList srsDimension="3">92910.141467166 436637.27978043 16.940625 92909.2558348048 436638.403347326 15.5699161049458 92909.2558348048 436638.403347326 16.940625 92910.141467166 436637.27978043 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_bbee8c78-4bb9-4e65-984a-6cb6895a3ad4">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e55dfd3f-9fbc-440f-96d3-8dc26f0fb17e">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5119aef9-e09c-43c4-97bc-04277a328351">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5119aef9-e09c-43c4-97bc-04277a328351_0_">
                      <gml:posList srsDimension="3">92904.9275040619 436633.178029514 16.940625 92904.0234493485 436634.293468223 16.940625 92904.0234493485 436634.293468223 15.610936073046 92904.9275040619 436633.178029514 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_421b36b4-cb54-4b11-9d6c-b0227c4b2a28">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c90d4161-b754-4a75-97a6-3fa594c86bcf">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_421635b1-490c-4a7c-9f3f-de2032dcfe1a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_421635b1-490c-4a7c-9f3f-de2032dcfe1a_0_">
                      <gml:posList srsDimension="3">92917.5644027011 436629.755554598 16.940625 92916.6966020969 436630.836007071 16.940625 92917.5644027011 436629.755554598 15.665625 92917.5644027011 436629.755554598 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_74c5ce3e-8b73-47cc-ba80-d0e2877423d4">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_9350ac92-9542-43a8-99af-0942d90f532c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_994ac017-7975-457d-90d7-6f3ecd6559da">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_994ac017-7975-457d-90d7-6f3ecd6559da_0_">
                      <gml:posList srsDimension="3">92916.0056111505 436628.50356038 16.940625 92916.0056111505 436628.50356038 15.6656249999063 92915.1378105462 436629.584012853 16.940625 92916.0056111505 436628.50356038 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d42fb5dc-b431-4c24-b4e2-598eb635084b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_5fc5710a-76e2-427a-9532-6177c867faf8">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e89c3674-d764-49c0-9384-643eec7842e8">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e89c3674-d764-49c0-9384-643eec7842e8_0_">
                      <gml:posList srsDimension="3">92911.1631654626 436640.135183909 2.52000000000002 92911.0312729559 436640.255721725 2.52000000000002 92911.0312729559 436640.255721725 15.234375 92911.1631654626 436640.135183909 15.234375 92911.1631654626 436640.135183909 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_561edfed-2522-4bd9-992a-a5d6aa2f9cda">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_85e6214a-c533-4fdc-8168-644836ed3cf4">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_42ba4aa2-7e77-42ba-b5ad-a6ea901eb4ae">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_42ba4aa2-7e77-42ba-b5ad-a6ea901eb4ae_0_">
                      <gml:posList srsDimension="3">92911.0312729559 436640.255721725 2.52000000000002 92910.8861454286 436640.359947438 2.52000000000002 92910.8861454286 436640.359947438 15.234375 92911.0312729559 436640.255721725 15.234375 92911.0312729559 436640.255721725 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_0fdc5094-b0c4-42aa-82c8-2010cf1b21b9">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_087b7a3d-0768-4672-813a-a8ccb7e90992">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1efa6be5-b9d5-4bc7-a9fb-a7ee0f847a30">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1efa6be5-b9d5-4bc7-a9fb-a7ee0f847a30_0_">
                      <gml:posList srsDimension="3">92910.8861454286 436640.359947438 2.52000000000002 92910.7297887567 436640.446420496 2.52000000000002 92910.7297887567 436640.446420496 15.234375 92910.8861454286 436640.359947438 15.234375 92910.8861454286 436640.359947438 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_573bf976-f0b3-44c5-b33f-16c6faef3ede">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_36767207-a366-45b0-9589-e692d4c54053">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_51dc6d03-9ee6-429b-8f39-d1cc25cb0045">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_51dc6d03-9ee6-429b-8f39-d1cc25cb0045_0_">
                      <gml:posList srsDimension="3">92910.7297887567 436640.446420496 2.52000000000002 92910.5643640197 436640.513945712 2.52000000000002 92910.5643640197 436640.513945712 15.234375 92910.7297887567 436640.446420496 15.234375 92910.7297887567 436640.446420496 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_640bec2c-100d-4154-bcbd-6606f0642376">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2763dc04-5f06-410e-844c-c118b9dd297e">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_608f3208-63d0-4ccb-af16-040a60baf076">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_608f3208-63d0-4ccb-af16-040a60baf076_0_">
                      <gml:posList srsDimension="3">92910.5643640197 436640.513945712 2.52000000000002 92910.3921576309 436640.561589789 2.52000000000002 92910.3921576309 436640.561589789 15.234375 92910.5643640197 436640.513945712 15.234375 92910.5643640197 436640.513945712 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_4cfbb74b-fc4f-40cb-b9f1-fd801c82ae98">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_cf68173c-3435-47ae-87ad-8a7c63505a5c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b9243d00-87f7-4c13-83a3-b5b5ffbf1ed9">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b9243d00-87f7-4c13-83a3-b5b5ffbf1ed9_0_">
                      <gml:posList srsDimension="3">92910.3921576309 436640.561589789 2.52000000000002 92910.2155497362 436640.588694217 2.52000000000002 92910.2155497362 436640.588694217 15.234375 92910.3921576309 436640.561589789 15.234375 92910.3921576309 436640.561589789 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_cc7e2b86-0e20-47ef-a03b-f31234a2bc26">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_76510180-7152-46ba-9a97-08a18a25bf20">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_08afd4a0-abab-4f34-903b-0772fced28a7">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_08afd4a0-abab-4f34-903b-0772fced28a7_0_">
                      <gml:posList srsDimension="3">92910.2155497362 436640.588694217 2.52000000000002 92910.0369813168 436640.594884371 2.52000000000002 92910.0369813168 436640.594884371 15.234375 92910.2155497362 436640.588694217 15.234375 92910.2155497362 436640.588694217 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_b66d7aba-b32d-49fe-8d8e-22dd54bf75b6">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_cc9785eb-a702-406e-aba8-07db57429607">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_252aae15-90e2-438f-864a-c51cc2f3f969">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_252aae15-90e2-438f-864a-c51cc2f3f969_0_">
                      <gml:posList srsDimension="3">92910.0369813168 436640.594884371 2.52000000000002 92909.8589204509 436640.580074695 2.52000000000002 92909.8589204509 436640.580074695 15.234375 92910.0369813168 436640.594884371 15.234375 92910.0369813168 436640.594884371 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_f82f66c5-f573-4599-8977-b063729dab30">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2af4ce3c-60a5-400e-8cd6-34e26c570eca">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9d0ea2f4-7e4b-425a-a544-0732d9cfc5fd">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9d0ea2f4-7e4b-425a-a544-0732d9cfc5fd_0_">
                      <gml:posList srsDimension="3">92909.8589204509 436640.580074695 2.52000000000002 92909.683828202 436640.544469881 2.52000000000002 92909.683828202 436640.544469881 15.234375 92909.8589204509 436640.580074695 15.234375 92909.8589204509 436640.580074695 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_28bf29d8-f29f-42a5-a927-f68d3b89c839">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_10efa79b-0147-4e89-8c7b-f1a476872edc">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9aceb406-7741-4a1c-90a9-bf24733e4321">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9aceb406-7741-4a1c-90a9-bf24733e4321_0_">
                      <gml:posList srsDimension="3">92909.683828202 436640.544469881 2.52000000000002 92909.5141246027 436640.488562038 2.52000000000002 92909.5141246027 436640.488562038 15.234375 92909.683828202 436640.544469881 15.234375 92909.683828202 436640.544469881 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_8547a329-5db6-46ee-9f88-02a74b72162b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_4e85e312-9990-495e-8cb9-2e3d20d2a665">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d72cb65f-7be9-47c4-8eb4-78028fb17ef9">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d72cb65f-7be9-47c4-8eb4-78028fb17ef9_0_">
                      <gml:posList srsDimension="3">92909.5141246027 436640.488562038 2.52000000000002 92909.3521552066 436640.413123897 2.52000000000002 92909.3521552066 436640.413123897 15.234375 92909.5141246027 436640.488562038 15.234375 92909.5141246027 436640.488562038 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_a083f4cd-e608-4c54-954f-e38113633af5">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_b502e802-a7cd-48f9-8a52-5e342f115ab0">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_12086a38-298b-409a-a780-598b8f6e89c9">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_12086a38-298b-409a-a780-598b8f6e89c9_0_">
                      <gml:posList srsDimension="3">92909.3521552066 436640.413123897 2.52000000000002 92909.2001586691 436640.319198123 2.52000000000002 92909.2001586691 436640.319198123 15.234375 92909.3521552066 436640.413123897 15.234375 92909.3521552066 436640.413123897 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_2dd27392-524b-45e1-a925-89cbe86386fb">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_394913f9-02e1-498b-b1a9-fa6d076dc288">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_15cea0b2-83de-434d-8d06-2475fcf9839e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_15cea0b2-83de-434d-8d06-2475fcf9839e_0_">
                      <gml:posList srsDimension="3">92909.2001586691 436640.319198123 2.52000000000002 92909.0602358063 436640.208082908 2.52000000000002 92909.0602358063 436640.208082908 15.234375 92909.2001586691 436640.319198123 15.234375 92909.2001586691 436640.319198123 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_fbc50394-2146-424f-a920-0d04690d0d85">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_494933b8-310e-429b-bdea-feebb02c83f4">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f8d40c40-6da0-4c82-8089-6981ea1e01a6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f8d40c40-6da0-4c82-8089-6981ea1e01a6_0_">
                      <gml:posList srsDimension="3">92909.0602358063 436640.208082908 2.52000000000002 92908.9343205581 436640.081314029 2.52000000000002 92908.9343205581 436640.081314029 15.234375 92909.0602358063 436640.208082908 15.234375 92909.0602358063 436640.208082908 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_346c5d86-6eb6-432b-a67e-d2c84ddf15a2">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_8d52cde3-0981-4ad2-a621-e6610ccf9441">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ad03abb0-26c6-40e0-a238-8207f3d47caf">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ad03abb0-26c6-40e0-a238-8207f3d47caf_0_">
                      <gml:posList srsDimension="3">92908.9343205581 436640.081314029 2.52000000000002 92908.8241532585 436639.940643618 2.52000000000002 92908.8241532585 436639.940643618 15.234375 92908.9343205581 436640.081314029 15.234375 92908.9343205581 436640.081314029 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_c21e005c-9f7b-49a1-b35a-fb486722ebbb">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_0882d567-8376-414f-9c82-042eefda5e44">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_96421f62-4fa8-43d8-9bf9-83e553627d5d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_96421f62-4fa8-43d8-9bf9-83e553627d5d_0_">
                      <gml:posList srsDimension="3">92908.8241532585 436639.940643618 2.52000000000002 92908.7312565819 436639.788015947 2.52000000000002 92908.7312565819 436639.788015947 15.234375 92908.8241532585 436639.940643618 15.234375 92908.8241532585 436639.940643618 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_00cca512-4c94-4de5-a5e4-b31e54378b68">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_d43e5d55-aae1-47f9-8d80-2633651c9b9e">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_da33e42c-600d-4066-941a-64330f0a6142">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_da33e42c-600d-4066-941a-64330f0a6142_0_">
                      <gml:posList srsDimension="3">92908.7312565819 436639.788015947 2.52000000000002 92908.6569144972 436639.625540555 2.52000000000002 92908.6569144972 436639.625540555 15.234375 92908.7312565819 436639.788015947 15.234375 92908.7312565819 436639.788015947 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_feaa1bf4-3429-4574-90d8-684969cea888">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_8082963c-0e39-49d8-a19d-f2bd65fcaf17">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_bee56d85-96ba-4c16-8b43-f0475a1337ef">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_bee56d85-96ba-4c16-8b43-f0475a1337ef_0_">
                      <gml:posList srsDimension="3">92915.4606690588 436641.564107537 16.940625 92914.6296227671 436642.70106255 15.6 92914.6296227671 436642.70106255 16.940625 92915.4606690588 436641.564107537 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_7f848f15-9b11-4b89-92f2-1e4101ef3af2">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_0928f6e2-068f-440b-9184-8259c9e3f00b">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_cd658293-2d3c-451b-81cd-fa56cebb1638">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_cd658293-2d3c-451b-81cd-fa56cebb1638_0_">
                      <gml:posList srsDimension="3">92908.6021545211 436639.455463092 2.52000000000002 92908.5677335175 436639.280134278 2.52000000000002 92908.5677335175 436639.280134278 15.234375 92908.6021545211 436639.455463092 15.234375 92908.6021545211 436639.455463092 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_0ba4f4d4-1dcf-469f-869f-0275ac4e9430">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_d6146761-8703-4f88-8225-ae5f1d868bce">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_fe8c8b90-811e-444b-a015-3a22bf822e98">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_fe8c8b90-811e-444b-a015-3a22bf822e98_0_">
                      <gml:posList srsDimension="3">92908.5677335175 436639.280134278 2.52000000000002 92908.5541272352 436639.101977416 2.52000000000002 92908.5541272352 436639.101977416 15.234375 92908.5677335175 436639.280134278 15.234375 92908.5677335175 436639.280134278 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_8fbdf998-dddd-4519-875b-356f113b550c">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2fb9d145-7750-4605-b7b1-22efa988fd5e">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_20e9ed1f-c3e0-4003-850a-c78ce6ad8f19">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_20e9ed1f-c3e0-4003-850a-c78ce6ad8f19_0_">
                      <gml:posList srsDimension="3">92908.5615237329 436638.923454896 15.234375 92908.5541272352 436639.101977416 15.234375 92908.5541272352 436639.101977416 2.52000000000002 92908.5615237329 436638.923454896 2.52000000000002 92908.5615237329 436638.923454896 15.234375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_c2614ecf-ee99-490c-bc20-3cb8c583671f">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_3c77e75b-c91b-48a2-adbf-11f50ec5ab9a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ba60098f-8469-4822-ac9e-147281da12c9">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ba60098f-8469-4822-ac9e-147281da12c9_0_">
                      <gml:posList srsDimension="3">92908.5898207803 436638.747034161 15.234375 92908.5615237329 436638.923454896 15.234375 92908.5615237329 436638.923454896 2.52000000000002 92908.5898207803 436638.747034161 2.52000000000002 92908.5898207803 436638.747034161 15.234375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_8bc0a6b6-832a-4e4d-83ba-586377e77d2b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_b067bb23-a53b-4065-a27a-9e5a78f29de2">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_932ca762-6159-4ae3-ae03-b9c025070160">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_932ca762-6159-4ae3-ae03-b9c025070160_0_">
                      <gml:posList srsDimension="3">92908.6386272706 436638.575153607 15.234375 92908.5898207803 436638.747034161 15.234375 92908.5898207803 436638.747034161 2.52000000000002 92908.6386272706 436638.575153607 2.52000000000002 92908.6386272706 436638.575153607 15.234375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_2f84f3bf-c771-41ec-9906-1a7db2e481da">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_06b4acb3-ee6b-410e-92c9-45b72115c45a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e31d6d86-de90-4d01-aea5-ce3fdf9b8146">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e31d6d86-de90-4d01-aea5-ce3fdf9b8146_0_">
                      <gml:posList srsDimension="3">92908.707268626 436638.410188875 15.234375 92908.6386272706 436638.575153607 15.234375 92908.6386272706 436638.575153607 2.52000000000002 92908.707268626 436638.410188875 2.52000000000002 92908.707268626 436638.410188875 15.234375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_5579c144-9bfd-4cec-8a88-30d7aa061957">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_3377672a-b322-4b12-8fa7-4dc63430765d">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_299d8a13-602f-42ed-af80-d8c290e80454">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_299d8a13-602f-42ed-af80-d8c290e80454_0_">
                      <gml:posList srsDimension="3">92908.7947961221 436638.254420021 15.234375 92908.707268626 436638.410188875 15.234375 92908.707268626 436638.410188875 2.52000000000002 92908.7947961221 436638.254420021 2.52000000000002 92908.7947961221 436638.254420021 15.234375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_ec262053-b7bb-41ff-9315-136813ebde8a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_28103c85-8822-4441-8d35-dbd14722797a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8c7cd584-500b-414b-bb91-e7aaed599f2c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8c7cd584-500b-414b-bb91-e7aaed599f2c_0_">
                      <gml:posList srsDimension="3">92908.9 436638.11 15.234375 92908.7947961221 436638.254420021 15.234375 92908.7947961221 436638.254420021 2.52000000000002 92908.9 436638.11 2.52000000000002 92908.9 436638.11 15.234375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_e9356930-e9b5-4473-804a-2bfc1400c4c9">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_5b0be3ab-5da1-4e54-a72b-b18a4a6b1bbe">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_af2cbfc4-310e-4882-bea8-5635f34ce694">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_af2cbfc4-310e-4882-bea8-5635f34ce694_0_">
                      <gml:posList srsDimension="3">92908.5599999987 436635.64 8.31000000000003 92907.4899999983 436637.010000002 8.31000000000003 92907.4899999983 436637.010000002 2.52000000000002 92908.5599999987 436635.64 2.52000000000002 92908.5599999987 436635.64 8.31000000000003</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_b518d8db-9ff8-43dc-bdac-893f3250ccc0">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_3cedefbc-8d74-4606-99bd-2418a383e953">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_882a1bad-1b7a-4d02-9b1d-9684ccef4c6d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_882a1bad-1b7a-4d02-9b1d-9684ccef4c6d_0_">
                      <gml:posList srsDimension="3">92908.5599999987 436635.64 2.52000000000002 92906.7399999983 436634.210000001 2.52000000000002 92906.7399999983 436634.210000001 8.31000000000003 92908.5599999987 436635.64 8.31000000000003 92908.5599999987 436635.64 2.52000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_b65d2eda-5922-446a-9328-6709b2bc87af">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_125f5e8a-5d72-4bbc-b91e-76f9b1f871e0">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5a9f5c9d-d9f2-4194-b0a0-8a9cc7715db6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5a9f5c9d-d9f2-4194-b0a0-8a9cc7715db6_0_">
                      <gml:posList srsDimension="3">92908.9299999997 436631.420000002 8.31000000000003 92906.7399999983 436634.210000001 8.31000000000003 92906.7399999983 436634.210000001 2.52000000000002 92908.9299999997 436631.420000002 2.52000000000002 92908.9299999997 436631.420000002 8.31000000000003</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_685bb76a-5478-4498-937c-3a8acb912e6b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_f09230b0-f4b6-44d4-8889-4608ac8614c9">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8ac5c114-df7a-4da9-807e-bd9a3244b912">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8ac5c114-df7a-4da9-807e-bd9a3244b912_0_">
                      <gml:posList srsDimension="3">92914.5599999987 436635.879999999 8.31000000000003 92908.9299999997 436631.420000002 8.31000000000003 92908.9299999997 436631.420000002 2.52000000000002 92914.5599999987 436635.879999999 2.52000000000002 92914.5599999987 436635.879999999 8.31000000000003</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_2f889ee0-0c53-4a1e-9a55-3a1cc64bd6d4">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_98d7debb-7224-494e-b314-79b15b7114b7">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c06f02e6-1c09-4ec5-97f9-9c4e5677ee8c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c06f02e6-1c09-4ec5-97f9-9c4e5677ee8c_0_">
                      <gml:posList srsDimension="3">92911.8435174404 436627.242565119 16.940625 92910.2479452063 436625.961029296 16.940625 92910.2479452063 436625.961029296 14.0671875 92911.8435174404 436627.242565119 14.0671875 92911.8435174404 436627.242565119 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_170a3763-c2e9-4bb2-bec6-dce8be5fa633">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_6ce73589-92a7-4e51-bfc3-94cbb7630e9c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4eddb87e-af18-4326-abf4-9fdd7a8ba39b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4eddb87e-af18-4326-abf4-9fdd7a8ba39b_0_">
                      <gml:posList srsDimension="3">92912.8599689164 436625.977035336 16.940625 92911.8435174404 436627.242565119 16.940625 92911.8435174404 436627.242565119 14.0671875 92912.8599689164 436625.977035336 14.0671875 92912.8599689164 436625.977035336 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_b7125866-dca4-445a-92bd-80c883d0f12d">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_6a5926cf-47ce-45b9-9c62-c285dfa1ba39">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ce16ee0a-d026-44b4-8570-d699188601ba">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ce16ee0a-d026-44b4-8570-d699188601ba_0_">
                      <gml:posList srsDimension="3">92910.2479452063 436625.961029296 14.0671875 92910.2479452063 436625.961029296 16.940625 92904.6083031146 436632.919319539 16.940625 92904.6083031146 436632.919319539 8.31000000000003 92910.2479452063 436625.961029296 8.31000000000003 92910.2479452063 436625.961029296 14.0671875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_27d457b2-8705-4890-bfb6-48d16f217b01">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_27d457b2-8705-4890-bfb6-48d16f217b01_0_">
                      <gml:posList srsDimension="3">92911.2699999995 436624.699999999 14.0671875 92910.2479452063 436625.961029296 14.0671875 92910.2479452063 436625.961029296 8.31000000000003 92911.2699999995 436624.699999999 8.31000000000003 92911.2699999995 436624.699999999 14.0671875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_56223c1d-263f-4cbc-8b97-0d02cfe26555">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_56223c1d-263f-4cbc-8b97-0d02cfe26555_0_">
                      <gml:posList srsDimension="3">92904.6083031146 436632.919319539 16.940625 92903.6999999993 436634.039999999 15.6046875 92903.6999999993 436634.039999999 8.31000000000003 92904.6083031146 436632.919319539 8.31000000000003 92904.6083031146 436632.919319539 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d917fd94-a310-468e-b537-38fe7faa89e5">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_8142cc95-7b5c-46dc-a9cb-594bcbb92473">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_860cf8ce-9dbd-414d-96d4-1f1cd64b354d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_860cf8ce-9dbd-414d-96d4-1f1cd64b354d_0_">
                      <gml:posList srsDimension="3">92912.1037071184 436640.664219408 8.31000000000003 92911.2800000012 436640.0 8.31000000000003 92911.28 436640.0 15.234375 92911.28 436640.0 15.5690589631466 92912.1037071184 436640.664219408 15.5578125 92912.1037071184 436640.664219408 8.31000000000003</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7194a724-ecc9-4f54-b057-97a7cda82250">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7194a724-ecc9-4f54-b057-97a7cda82250_0_">
                      <gml:posList srsDimension="3">92914.6296227671 436642.70106255 15.6 92914.6296227671 436642.70106255 8.31000000000003 92912.1037071184 436640.664219408 8.31000000000003 92912.1037071184 436640.664219408 15.5578125 92912.1037071184 436640.664219408 16.940625 92914.6296227671 436642.70106255 16.940625 92914.6296227671 436642.70106255 15.6</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_699ead19-ebff-464d-b0de-ebbcdc76ce8b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_699ead19-ebff-464d-b0de-ebbcdc76ce8b_0_">
                      <gml:posList srsDimension="3">92915.6700000018 436643.539999999 8.31000000000003 92914.6296227671 436642.70106255 8.31000000000003 92914.6296227671 436642.70106255 15.6 92915.67 436643.54 15.5396828329548 92915.6700000018 436643.539999999 8.31000000000003</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a6332cc6-6b6b-406f-9ff9-2776ae446537">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a6332cc6-6b6b-406f-9ff9-2776ae446537_0_">
                      <gml:posList srsDimension="3">92908.9 436638.11 15.234375 92908.9 436638.11 2.52000000000002 92907.4899999983 436637.010000002 2.52000000000002 92907.4899999983 436637.010000002 8.31000000000003 92907.4899999983 436637.010000002 16.940625 92908.9 436638.11 16.940625 92908.9 436638.11 15.234375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c11f803f-9907-4098-a61b-3f188703b8e3">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c11f803f-9907-4098-a61b-3f188703b8e3_0_">
                      <gml:posList srsDimension="3">92909.2558348048 436638.403347326 15.5699161049458 92909.2558348048 436638.403347326 15.234375 92908.9 436638.11 15.234375 92908.9 436638.11 16.940625 92909.2558348048 436638.403347326 16.940625 92909.2558348048 436638.403347326 15.5699161049458</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ce959514-734f-40cc-bb2a-0c68d6197a7b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ce959514-734f-40cc-bb2a-0c68d6197a7b_0_">
                      <gml:posList srsDimension="3">92907.4899999983 436637.010000002 16.940625 92907.4899999983 436637.010000002 8.31000000000003 92904.0234493485 436634.293468223 8.31000000000003 92904.0234493485 436634.293468223 15.610936073046 92904.0234493485 436634.293468223 16.940625 92907.4899999983 436637.010000002 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_09c29441-77f1-4be2-bd83-feed6a91014e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_09c29441-77f1-4be2-bd83-feed6a91014e_0_">
                      <gml:posList srsDimension="3">92911.28 436640.0 15.234375 92909.2558348048 436638.403347326 15.234375 92909.2558348048 436638.403347326 15.5699161049458 92911.28 436640.0 15.5690589631466 92911.28 436640.0 15.234375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_338328a9-cc25-4b15-84e5-43671a342d82">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_338328a9-cc25-4b15-84e5-43671a342d82_0_">
                      <gml:posList srsDimension="3">92904.0234493485 436634.293468223 8.31000000000003 92903.6999999993 436634.039999999 8.31000000000003 92903.6999999993 436634.039999999 15.6046875 92904.0234493485 436634.293468223 15.610936073046 92904.0234493485 436634.293468223 8.31000000000003</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_29a1da23-76b8-49f5-ac0e-546303092474">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_a3ab95bc-67f8-41d9-af4f-ad11fbdd4ba1">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c949ada8-5415-4524-b50f-6757f87c7973">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c949ada8-5415-4524-b50f-6757f87c7973_0_">
                      <gml:posList srsDimension="3">92916.6002933869 436642.397104939 8.31000000000003 92915.6700000018 436643.539999999 8.31000000000003 92915.67 436643.54 15.5396828329548 92916.6002933869 436642.397104939 16.940625 92916.6002933869 436642.397104939 8.31000000000003</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a8070fb9-5cee-488e-a180-21d13593fa04">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a8070fb9-5cee-488e-a180-21d13593fa04_0_">
                      <gml:posList srsDimension="3">92922.2371505127 436635.472046392 14.0671875 92922.2371505128 436635.472046392 8.31000000000003 92916.6002933869 436642.397104939 8.31000000000003 92916.6002933869 436642.397104939 16.940625 92922.2371505127 436635.472046392 16.940625 92922.2371505127 436635.472046392 14.0671875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_503e5d6d-9d36-4245-a236-7addbc03ed06">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_503e5d6d-9d36-4245-a236-7addbc03ed06_0_">
                      <gml:posList srsDimension="3">92922.8900000006 436634.670000002 8.31000000000003 92922.2371505128 436635.472046392 8.31000000000003 92922.2371505127 436635.472046392 14.0671875 92922.8900000006 436634.670000002 14.0671875 92922.8900000006 436634.670000002 8.31000000000003</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7b8a6d4c-79ee-4dd3-a18f-64e4b7f14ee3">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7b8a6d4c-79ee-4dd3-a18f-64e4b7f14ee3_0_">
                      <gml:posList srsDimension="3">92923.2100000009 436634.289999999 8.31000000000003 92922.8900000006 436634.670000002 8.31000000000003 92922.8900000006 436634.670000002 14.0671875 92923.2100000009 436634.289999999 14.0671875 92923.2100000009 436634.289999999 8.31000000000003</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_b6e743a4-dbe2-425c-b762-e820a937b6a4">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_274be173-b70b-4644-a77e-231b7e307b53">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0c876cdc-0f3d-44d8-9f3d-fd47c12c2879">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0c876cdc-0f3d-44d8-9f3d-fd47c12c2879_0_">
                      <gml:posList srsDimension="3">92922.2371505127 436635.472046392 16.940625 92919.7048466431 436633.410802431 16.940625 92919.7048466431 436633.410802431 14.0671875 92922.2371505127 436635.472046392 14.0671875 92922.2371505127 436635.472046392 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_18f13542-9e6b-4959-9f89-708c33011715">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_76427647-49d1-4f50-9846-d03e595875f8">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5fc01134-58a9-4b6c-962b-dcdd73cdcf76">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5fc01134-58a9-4b6c-962b-dcdd73cdcf76_0_">
                      <gml:posList srsDimension="3">92920.6577761059 436632.240098229 14.0671875 92919.7048466431 436633.410802431 14.0671875 92919.7048466431 436633.410802431 16.940625 92920.657776106 436632.240098229 16.940625 92920.6577761059 436632.240098229 14.0671875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_262048cf-4b7b-40d2-afbd-fa59d1160312">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_b5893a75-08e1-448c-bb85-a6e0c1744f33">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_955277dc-2074-41ad-a59b-dd7a9aad4498">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_955277dc-2074-41ad-a59b-dd7a9aad4498_0_">
                      <gml:posList srsDimension="3">92916.0056111505 436628.50356038 16.940625 92912.8599689164 436625.977035336 16.940625 92912.8599689164 436625.977035336 14.0671875 92912.8599689164 436625.977035336 8.31000000000003 92916.0056111505 436628.50356038 8.31000000000003 92916.0056111505 436628.50356038 15.6656249999063 92916.0056111505 436628.50356038 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b37365bd-6881-442a-976e-07d306084b4d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b37365bd-6881-442a-976e-07d306084b4d_0_">
                      <gml:posList srsDimension="3">92920.6577761059 436632.240098229 14.0671875 92920.657776106 436632.240098229 16.940625 92917.5644027011 436629.755554598 16.940625 92917.5644027011 436629.755554598 15.665625 92917.5644027012 436629.755554598 8.31000000000003 92920.657776106 436632.240098229 8.31000000000003 92920.6577761059 436632.240098229 14.0671875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2d50d579-7251-4a46-9434-f1be04fe2a5c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2d50d579-7251-4a46-9434-f1be04fe2a5c_0_">
                      <gml:posList srsDimension="3">92912.8599689164 436625.977035336 14.0671875 92911.2699999995 436624.699999999 14.0671875 92911.2699999995 436624.699999999 8.31000000000003 92912.8599689164 436625.977035336 8.31000000000003 92912.8599689164 436625.977035336 14.0671875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f53fc387-57e2-4d64-bd43-e7b316cff5e5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f53fc387-57e2-4d64-bd43-e7b316cff5e5_0_">
                      <gml:posList srsDimension="3">92923.2100000009 436634.289999999 14.0671875 92920.6577761059 436632.240098229 14.0671875 92920.657776106 436632.240098229 8.31000000000003 92923.2100000009 436634.289999999 8.31000000000003 92923.2100000009 436634.289999999 14.0671875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2b21aaf5-5102-4740-87fc-3dbbadfe381e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2b21aaf5-5102-4740-87fc-3dbbadfe381e_0_">
                      <gml:posList srsDimension="3">92917.5644027011 436629.755554598 15.665625 92916.0056111505 436628.50356038 15.6656249999063 92916.0056111505 436628.50356038 8.31000000000003 92917.5644027012 436629.755554598 8.31000000000003 92917.5644027011 436629.755554598 15.665625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:OuterCeilingSurface gml:id="UUID_1e8bd7ec-1bee-4517-997e-1e69e42b46f9">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e77e53dc-0043-4b62-8bf2-0952034381a9">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8b31e72c-8d7b-4460-a096-912ea66308a2">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8b31e72c-8d7b-4460-a096-912ea66308a2_0_">
                      <gml:posList srsDimension="3">92922.2371505128 436635.472046392 8.31000000000003 92922.8900000006 436634.670000002 8.31000000000003 92923.2100000009 436634.289999999 8.31000000000003 92920.657776106 436632.240098229 8.31000000000003 92917.5644027012 436629.755554598 8.31000000000003 92916.0056111505 436628.50356038 8.31000000000003 92912.8599689164 436625.977035336 8.31000000000003 92911.2699999995 436624.699999999 8.31000000000003 92910.2479452063 436625.961029296 8.31000000000003 92904.6083031146 436632.919319539 8.31000000000003 92903.6999999993 436634.039999999 8.31000000000003 92904.0234493485 436634.293468223 8.31000000000003 92907.4899999983 436637.010000002 8.31000000000003 92908.5599999987 436635.64 8.31000000000003 92906.7399999983 436634.210000001 8.31000000000003 92908.9299999997 436631.420000002 8.31000000000003 92914.5599999987 436635.879999999 8.31000000000003 92911.2800000012 436640.0 8.31000000000003 92912.1037071184 436640.664219408 8.31000000000003 92914.6296227671 436642.70106255 8.31000000000003 92915.6700000018 436643.539999999 8.31000000000003 92916.6002933869 436642.397104939 8.31000000000003 92922.2371505128 436635.472046392 8.31000000000003</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:OuterCeilingSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_d5376191-1b59-47a9-8d66-0a64dc4bbb1f">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_88a71f99-e567-4ca4-b868-bfdc29cbdaca">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_30704ec4-2fa8-46c8-9509-052ed53f54c6">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_30704ec4-2fa8-46c8-9509-052ed53f54c6_0_">
                      <gml:posList srsDimension="3">92915.67 436643.54 15.5396828329548 92914.6296227671 436642.70106255 15.6 92915.4606690588 436641.564107537 16.940625 92916.6002933869 436642.397104939 16.940625 92915.67 436643.54 15.5396828329548</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_a598aa1b-e473-409c-a84a-7c0bd73d8f0d">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_d0fd8aee-9c01-4f74-a358-89e1b5ec2a6c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8b448d66-c148-4e08-89e7-cf23bc735f0a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8b448d66-c148-4e08-89e7-cf23bc735f0a_0_">
                      <gml:posList srsDimension="3">92912.1037071184 436640.664219408 15.5578125 92911.28 436640.0 15.5690589631466 92909.2558348048 436638.403347326 15.5699161049458 92910.141467166 436637.27978043 16.940625 92912.9971597719 436639.530731215 16.940625 92912.1037071184 436640.664219408 15.5578125</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_7e938c8d-7c0f-4cbf-8b7a-ebde51ebe42f">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_608ae128-1ecc-4ce4-a077-8eef567aa513">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9213f60c-31c1-42c0-aae9-20bb5982e5fb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9213f60c-31c1-42c0-aae9-20bb5982e5fb_0_">
                      <gml:posList srsDimension="3">92922.2371505127 436635.472046392 16.940625 92916.6002933869 436642.397104939 16.940625 92915.4606690588 436641.564107537 16.940625 92914.6296227671 436642.70106255 16.940625 92912.1037071184 436640.664219408 16.940625 92912.9971597719 436639.530731215 16.940625 92910.141467166 436637.27978043 16.940625 92909.2558348048 436638.403347326 16.940625 92908.9 436638.11 16.940625 92907.4899999983 436637.010000002 16.940625 92904.0234493485 436634.293468223 16.940625 92904.9275040619 436633.178029514 16.940625 92904.6083031146 436632.919319539 16.940625 92910.2479452063 436625.961029296 16.940625 92911.8435174404 436627.242565119 16.940625 92912.8599689164 436625.977035336 16.940625 92916.0056111505 436628.50356038 16.940625 92915.1378105462 436629.584012853 16.940625 92916.6966020969 436630.836007071 16.940625 92917.5644027011 436629.755554598 16.940625 92920.657776106 436632.240098229 16.940625 92919.7048466431 436633.410802431 16.940625 92922.2371505127 436635.472046392 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_4dd6d27d-0796-46ae-9681-f696dce62252">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_680b6f6f-1746-44c0-aeb2-640837b6ee25">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_49e5f7f2-f5cd-406a-b12e-5ce95a6a0dba">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_49e5f7f2-f5cd-406a-b12e-5ce95a6a0dba_0_">
                      <gml:posList srsDimension="3">92911.8435174404 436627.242565119 14.0671875 92910.2479452063 436625.961029296 14.0671875 92911.2699999995 436624.699999999 14.0671875 92912.8599689164 436625.977035336 14.0671875 92911.8435174404 436627.242565119 14.0671875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_16ece9d3-5f0b-4cea-94f2-0743070c6bd2">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_b91f9fbd-5aa9-45f9-9c82-9ac6ae846d33">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ecdae91e-4da3-45c5-b629-3ec98971eef7">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ecdae91e-4da3-45c5-b629-3ec98971eef7_0_">
                      <gml:posList srsDimension="3">92910.2155497362 436640.588694217 15.234375 92910.0369813168 436640.594884371 15.234375 92909.8589204509 436640.580074695 15.234375 92909.683828202 436640.544469881 15.234375 92909.5141246027 436640.488562038 15.234375 92909.3521552066 436640.413123897 15.234375 92909.2001586691 436640.319198123 15.234375 92909.0602358063 436640.208082908 15.234375 92908.9343205581 436640.081314029 15.234375 92908.8241532585 436639.940643618 15.234375 92908.7312565819 436639.788015947 15.234375 92908.6569144972 436639.625540555 15.234375 92908.6021545211 436639.455463092 15.234375 92908.5677335175 436639.280134278 15.234375 92908.5541272352 436639.101977416 15.234375 92908.5615237329 436638.923454896 15.234375 92908.5898207803 436638.747034161 15.234375 92908.6386272706 436638.575153607 15.234375 92908.707268626 436638.410188875 15.234375 92908.7947961221 436638.254420021 15.234375 92908.9 436638.11 15.234375 92909.2558348048 436638.403347326 15.234375 92911.28 436640.0 15.234375 92911.1631654626 436640.135183909 15.234375 92911.0312729559 436640.255721725 15.234375 92910.8861454286 436640.359947438 15.234375 92910.7297887567 436640.446420496 15.234375 92910.5643640197 436640.513945712 15.234375 92910.3921576309 436640.561589789 15.234375 92910.2155497362 436640.588694217 15.234375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_52a0fa60-e0c6-48c6-bb18-ebcb23bc5dbb">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_134b96de-09f6-45eb-8228-0f2b984e24af">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5f56fb00-2544-4ab8-95d2-d2773e9ada4c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5f56fb00-2544-4ab8-95d2-d2773e9ada4c_0_">
                      <gml:posList srsDimension="3">92904.9275040619 436633.178029514 16.940625 92904.0234493485 436634.293468223 15.610936073046 92903.6999999993 436634.039999999 15.6046875 92904.6083031146 436632.919319539 16.940625 92904.9275040619 436633.178029514 16.940625</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:AddressDetails>
              <xAL:Country>
                <xAL:CountryName>Nederland</xAL:CountryName>
                <xAL:Locality Type="Town">
                  <xAL:LocalityName>Rotterdam</xAL:LocalityName>
                  <xAL:Thoroughfare Type="Street">
                    <xAL:ThoroughfareNumber>88-89</xAL:ThoroughfareNumber>
                    <xAL:ThoroughfareName>Scheepmakerskade</xAL:ThoroughfareName>
                  </xAL:Thoroughfare>
                  <xAL:PostalCode>
                    <xAL:PostalCodeNumber>3011VX</xAL:PostalCodeNumber>
                  </xAL:PostalCode>
                </xAL:Locality>
              </xAL:Country>
            </xAL:AddressDetails>
          </xalAddress>
          <multiPoint>
            <gml:MultiPoint>
              <gml:pointMember>
                <gml:Point>
                  <gml:pos srsDimension="3">92909.22 436633.273333333 2.55633333333314</gml:pos>
                </gml:Point>
              </gml:pointMember>
            </gml:MultiPoint>
          </multiPoint>
        </Address>
      </bldg:address>
    </bldg:Building>
  </cityObjectMember>
  <cityObjectMember>
    <bldg:Building gml:id="ID_0599100000690544">
      <gml:boundedBy>
        <gml:Envelope srsName="urn:ogc:def:crs:EPSG::28992" srsDimension="3">
          <gml:lowerCorner>92849.78 436822.67 2.57850000000051</gml:lowerCorner>
          <gml:upperCorner>92871.588 436839.690000001 19.725</gml:upperCorner>
        </gml:Envelope>
      </gml:boundedBy>
      <creationDate>2019-06-11</creationDate>
      <gen:stringAttribute name="typeOmschr">
        <gen:value>tussenpand</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="statusOmschr">
        <gen:value>Pand in gebruik</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="gebouwnummer">
        <gen:value>0599100000690544</gen:value>
      </gen:stringAttribute>
      <gen:stringAttribute name="deviation">
        <gen:value>yes</gen:value>
      </gen:stringAttribute>
      <gen:intAttribute name="aantalBouwlagen">
        <gen:value>7</gen:value>
      </gen:intAttribute>
      <gen:intAttribute name="hoogste_bouwlaag">
        <gen:value>5</gen:value>
      </gen:intAttribute>
      <gen:intAttribute name="laagste_bouwlaag">
        <gen:value>1</gen:value>
      </gen:intAttribute>
      <app:appearance>
        <app:Appearance gml:id="UUID_335fb1ac-0a13-4e8f-b615-d547c5c2ba79">
          <app:theme>RhinoCity texturing</app:theme>
          <app:surfaceDataMember>
            <app:ParameterizedTexture gml:id="UUID_bc5123da-1f3a-4b7a-b180-769752c9cab2">
              <app:imageURI>appearance/tex_35.jpg</app:imageURI>
              <app:textureType>specific</app:textureType>
              <app:wrapMode>border</app:wrapMode>
              <app:borderColor>0.0 0.0 0.0 1.0</app:borderColor>
              <app:target uri="#RCID_e46e6020-63eb-435b-95db-0affd8aad3b8">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_e46e6020-63eb-435b-95db-0affd8aad3b8_0_">0.270366 0.535089 0.227006 0.529805 0.237109 0.506354 0.280465 0.511647 0.270366 0.535089</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_55163e44-8fa9-44aa-b966-5367e66a8894">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_55163e44-8fa9-44aa-b966-5367e66a8894_0_">0.37745 0.028384 0.362271 0.043866 0.395781 0.048192 0.365448 0.07906 0.332242 0.074808 0.297086 0.110839 0.331658 0.115255 0.32716 0.119933 0.308115 0.137167 0.267518 0.178284 0.235322 0.17412 0.222665 0.186921 0.009435 0.159367 0.037845 0.129767 0.001957 0.125206 0.03884 0.086681 0.074065 0.091169 0.093055 0.071382 0.057794 0.066883 0.094029 0.029035 0.130706 0.033688 0.1619 9.78E-4 0.37745 0.028384</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_0ecced3c-aa16-4f45-b9e7-f3ba59070d1f">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_0ecced3c-aa16-4f45-b9e7-f3ba59070d1f_0_">0.526125 0.506354 0.55728 0.510004 0.547778 0.531375 0.516634 0.527704 0.526125 0.506354</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_8e7491b1-e490-4746-8bda-1064c5da296d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_8e7491b1-e490-4746-8bda-1064c5da296d_0_">0.012068 0.506354 0.039893 0.509561 0.101891 0.515566 0.091352 0.539386 0.001957 0.529205 0.012068 0.506354</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2afd5dc1-69b7-443a-bcb4-2a7839cd4bdc">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2afd5dc1-69b7-443a-bcb4-2a7839cd4bdc_0_">0.221931 0.519766 0.221289 0.52233 0.219537 0.524845 0.216787 0.52724 0.213079 0.529437 0.208525 0.531376 0.203281 0.533007 0.197457 0.534281 0.191284 0.535149 0.184889 0.5356 0.178449 0.535614 0.172211 0.535192 0.176558 0.530642 0.198558 0.506354 0.204278 0.507355 0.209428 0.508745 0.213842 0.510483 0.21738 0.51252 0.219953 0.514786 0.221498 0.517231 0.221931 0.519766</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_a22c043a-6077-4110-8537-164f06d43c0b">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_a22c043a-6077-4110-8537-164f06d43c0b_0_">0.831703 0.468402 0.859838 0.438905 0.894781 0.443361 0.86713 0.472278 0.857757 0.471063 0.842086 0.469089 0.837759 0.469589 0.831703 0.468402</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_1f4af2ea-38d6-4b38-9992-8331d9ff4714">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_1f4af2ea-38d6-4b38-9992-8331d9ff4714_0_">0.318468 0.502622 0.317926 0.503232 0.284687 0.499039 0.069654 0.471905 0.038547 0.504291 0.001957 0.499684 0.030678 0.469901 0.060571 0.438905 0.344852 0.47603 0.318468 0.502622</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_ef3684d0-1140-4c64-9bdd-849ddd15a0a0">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_ef3684d0-1140-4c64-9bdd-849ddd15a0a0_0_">0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354 0.941292 0.506354</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_97585603-118b-4ee5-a225-b8ce15f98d9d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_97585603-118b-4ee5-a225-b8ce15f98d9d_0_">0.60274 0.528272 0.611705 0.506354 0.618691 0.507088 0.60274 0.528272</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_62c6703d-c08c-4288-891f-99d68db668f3">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_62c6703d-c08c-4288-891f-99d68db668f3_0_">0.436399 0.506354 0.46601 0.509788 0.456403 0.532017 0.436399 0.506354</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_29908dc2-7a5b-45bb-a675-1889770b7734">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_29908dc2-7a5b-45bb-a675-1889770b7734_0_">0.395303 0.527669 0.41214 0.506354 0.432331 0.532017 0.395303 0.527669</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_d783e4e6-00c0-47aa-a758-26180b38b9f0">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_d783e4e6-00c0-47aa-a758-26180b38b9f0_0_">0.080198 0.436006 0.00494 0.428136 0.004635 0.416633 0.001957 0.315738 0.076693 0.323616 0.079502 0.413687 0.080198 0.436006</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_f7bf8fb7-c5d8-41f4-9cfe-a5432e451c9d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_f7bf8fb7-c5d8-41f4-9cfe-a5432e451c9d_0_">0.191032 0.436229 0.113719 0.428149 0.113262 0.404521 0.111546 0.315738 0.188322 0.323826 0.190755 0.424724 0.191032 0.436229</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_6f72899f-1b1e-451c-9199-39c412d75e5f">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_6f72899f-1b1e-451c-9199-39c412d75e5f_0_">0.784538 0.41206 0.72328 0.405623 0.720157 0.315738 0.781074 0.32218 0.784538 0.41206</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9ef8c477-cc96-42c8-8185-0ba9fbf6dda0">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9ef8c477-cc96-42c8-8185-0ba9fbf6dda0_0_">0.715487 0.41184 0.656412 0.405628 0.65362 0.315738 0.712366 0.321956 0.715487 0.41184</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_77aee94c-52e0-479d-afaf-15d064d818e0">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_77aee94c-52e0-479d-afaf-15d064d818e0_0_">0.850432 0.410691 0.790022 0.404339 0.78865 0.315738 0.848727 0.322096 0.850432 0.410691</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_e4bed554-48a7-463c-b300-2440c491f407">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_e4bed554-48a7-463c-b300-2440c491f407_0_">0.428508 0.420647 0.389854 0.416517 0.387476 0.315738 0.425888 0.319871 0.428508 0.420647</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9c7df768-6ff9-4ba7-bb85-e5b09dff6c7c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9c7df768-6ff9-4ba7-bb85-e5b09dff6c7c_0_">0.167228 0.535484 0.107985 0.529403 0.107632 0.506354 0.166789 0.512437 0.167228 0.535484</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9e8650dd-0117-46a1-a146-de3f7bbdd61c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9e8650dd-0117-46a1-a146-de3f7bbdd61c_0_">0.387954 0.533091 0.356164 0.529563 0.359247 0.506354 0.390985 0.509882 0.387954 0.533091</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_df840330-16e3-4c74-94d7-e2522f33c5fa">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_df840330-16e3-4c74-94d7-e2522f33c5fa_0_">0.476624 0.506354 0.511701 0.510318 0.50676 0.532161 0.471624 0.528196 0.476624 0.506354</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_f6f71cfc-d24c-484f-9375-5db4989e0aa4">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_f6f71cfc-d24c-484f-9375-5db4989e0aa4_0_">0.350817 0.534636 0.286394 0.5281 0.285714 0.506354 0.350049 0.512891 0.350817 0.534636</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_a2b2e5bc-c1b4-490d-b7db-4217148fe85d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_a2b2e5bc-c1b4-490d-b7db-4217148fe85d_0_">0.566201 0.506354 0.597922 0.50994 0.595453 0.521837 0.561644 0.52806 0.566201 0.506354</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_516178fb-28cf-4aa2-8915-a264eb676e34">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_516178fb-28cf-4aa2-8915-a264eb676e34_0_">0.355405 0.438905 0.569499 0.462612 0.564744 0.484789 0.350294 0.461078 0.355405 0.438905</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_80caa148-7485-4d66-b488-af69a583783a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_80caa148-7485-4d66-b488-af69a583783a_0_">0.716243 0.113871 0.755924 9.78E-4 0.858305 0.013057 0.822878 0.116136 0.8195 0.125966 0.716243 0.113871</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c0b9ca0d-681a-4799-bc63-9150bbefa616">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c0b9ca0d-681a-4799-bc63-9150bbefa616_0_">0.279505 0.315738 0.310961 0.319502 0.276324 0.422443 0.244618 0.418686 0.279505 0.315738</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_8bba7f35-e02f-4769-90b6-23317b5f7b1e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_8bba7f35-e02f-4769-90b6-23317b5f7b1e_0_">0.869174 0.406663 0.855186 0.405052 0.8664 0.315738 0.880302 0.31735 0.869174 0.406663</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_de9d4853-c547-4719-9731-e49697f1448a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_de9d4853-c547-4719-9731-e49697f1448a_0_">0.699295 0.112744 0.696093 0.13661 0.497065 0.114459 0.513832 9.78E-4 0.711318 0.023125 0.699295 0.112744</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_007fa201-bf97-4b18-8a1d-e6480d9cb297">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_007fa201-bf97-4b18-8a1d-e6480d9cb297_0_">0.892743 0.406035 0.88454 0.405041 0.895569 0.315738 0.903721 0.316731 0.892743 0.406035</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_45de4898-9bbb-459c-86da-cd741cdba270">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_45de4898-9bbb-459c-86da-cd741cdba270_0_">0.223445 0.432446 0.195695 0.419215 0.210704 0.315738 0.23966 0.319092 0.223445 0.432446</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_12e49e26-e0bd-40ba-9803-c35e760afae1">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_12e49e26-e0bd-40ba-9803-c35e760afae1_0_">0.876559 0.292241 0.914258 0.189638 0.990306 0.198581 0.953409 0.300619 0.949499 0.311431 0.872798 0.302477 0.876559 0.292241</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_cbbfaf36-c871-49c8-b293-ea49e8f4e4e3">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_cbbfaf36-c871-49c8-b293-ea49e8f4e4e3_0_">0.432485 0.417648 0.468884 0.315738 0.496204 0.318991 0.461373 0.417084 0.460011 0.42092 0.432485 0.417648</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_b979062f-7864-4f86-8b24-77782be8c017">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_b979062f-7864-4f86-8b24-77782be8c017_0_">0.627882 0.509542 0.628959 0.506354 0.639487 0.507612 0.634806 0.521501 0.624266 0.520243 0.627882 0.509542</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_21f5b59b-2da3-48d7-a2ea-2568e667e2ce">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_21f5b59b-2da3-48d7-a2ea-2568e667e2ce_0_">0.352586 0.315738 0.382908 0.319342 0.345656 0.421826 0.315068 0.418297 0.352586 0.315738</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_0a101672-4f72-4bb7-8186-3787b3c145ae">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_0a101672-4f72-4bb7-8186-3787b3c145ae_0_">0.827193 0.506354 0.888282 0.512413 0.887107 0.515492 0.825832 0.509874 0.827193 0.506354</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_5363a890-ef24-458c-b8ad-3715c39ef891">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_5363a890-ef24-458c-b8ad-3715c39ef891_0_">0.022786 0.189638 0.305032 0.222505 0.286114 0.313065 0.001957 0.280171 0.022786 0.189638</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_6ac8bb08-4088-445e-9d56-5d08ab0d0764">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_6ac8bb08-4088-445e-9d56-5d08ab0d0764_0_">0.58374 0.315738 0.649464 0.323499 0.616078 0.413733 0.549902 0.405963 0.58374 0.315738</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_61687175-5d6e-4d49-a309-50a0a6244eff">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_61687175-5d6e-4d49-a309-50a0a6244eff_0_">0.505413 0.406013 0.538025 0.315738 0.545399 0.316516 0.508417 0.419048 0.500978 0.418289 0.505413 0.406013</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_181a6562-9337-427c-82c7-7351aa50a5df">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_181a6562-9337-427c-82c7-7351aa50a5df_0_">0.940272 0.315738 0.941724 0.315893 0.909486 0.40605 0.908023 0.405895 0.940272 0.315738</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_654e02de-cdaf-4a9d-bd01-b0aa49713118">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_654e02de-cdaf-4a9d-bd01-b0aa49713118_0_">0.993753 0.471243 0.900655 0.46159 0.900196 0.438905 0.993161 0.448559 0.993753 0.471243</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_29199e93-63b1-4993-9128-fb2e1583bcbb">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_29199e93-63b1-4993-9128-fb2e1583bcbb_0_">0.823562 0.474568 0.708415 0.461834 0.711932 0.438905 0.826894 0.451639 0.823562 0.474568</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_f5b6b5c5-143b-421e-aefb-cf5fa0080879">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_f5b6b5c5-143b-421e-aefb-cf5fa0080879_0_">0.602346 0.312045 0.596869 0.311703 0.61423 0.189638 0.619662 0.18998 0.602346 0.312045</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_b580f0de-ca88-4f45-8847-2f895f2f3e02">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_b580f0de-ca88-4f45-8847-2f895f2f3e02_0_">0.80997 0.189657 0.815453 0.189638 0.798092 0.311696 0.792564 0.311714 0.80997 0.189657</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_97cba3f3-a10d-4e9a-867b-b1942b510a4b">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_97cba3f3-a10d-4e9a-867b-b1942b510a4b_0_">0.453849 0.190017 0.459171 0.189638 0.441764 0.311703 0.436399 0.312082 0.453849 0.190017</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2190ddfd-f72c-4870-b6e3-bb0186497ab1">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2190ddfd-f72c-4870-b6e3-bb0186497ab1_0_">0.534125 0.19036 0.53914 0.189638 0.521689 0.311703 0.516634 0.312425 0.534125 0.19036</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_1bba28a3-8999-490b-ac9e-d7d5438d9ff4">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_1bba28a3-8999-490b-ac9e-d7d5438d9ff4_0_">0.084149 0.316526 0.088403 0.315738 0.106181 0.435749 0.101895 0.436535 0.084149 0.316526</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_45fb137d-ceba-436b-9492-cf3ec922bf81">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_45fb137d-ceba-436b-9492-cf3ec922bf81_0_">0.392391 0.189638 0.396849 0.191519 0.354797 0.312978 0.350294 0.311095 0.392391 0.189638</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_39fd486f-edcb-4721-a25f-5b870b3ac3a0">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_39fd486f-edcb-4721-a25f-5b870b3ac3a0_0_">0.586246 0.189638 0.591363 0.191233 0.549199 0.312682 0.544031 0.311085 0.586246 0.189638</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_57f57ac6-e019-4f5e-91ac-a510e7ce6442">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_57f57ac6-e019-4f5e-91ac-a510e7ce6442_0_">0.666534 0.189638 0.672167 0.190891 0.629953 0.312337 0.624266 0.311083 0.666534 0.189638</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_59b75d4c-8c90-4c30-9cf8-d1b5cefe8091">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_59b75d4c-8c90-4c30-9cf8-d1b5cefe8091_0_">0.719427 0.189638 0.725422 0.19051 0.683154 0.311955 0.677104 0.311082 0.719427 0.189638</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_1311acea-7e35-4ab7-88be-332daa314d3a">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_1311acea-7e35-4ab7-88be-332daa314d3a_0_">0.772321 0.189638 0.778484 0.190121 0.73616 0.311557 0.729941 0.311074 0.772321 0.189638</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_029612df-36ba-48db-b8fd-0324309a731c">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_029612df-36ba-48db-b8fd-0324309a731c_0_">0.862396 0.189638 0.868548 0.189694 0.826168 0.311129 0.819961 0.311074 0.862396 0.189638</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_4b9c630d-9f7b-4c7c-aba4-5265279cf65f">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_4b9c630d-9f7b-4c7c-aba4-5265279cf65f_0_">0.782779 0.189975 0.787322 0.189638 0.787473 0.311428 0.782891 0.311766 0.782779 0.189975</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_ffc2b791-c732-4f0f-96f7-571a1c52d696">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_ffc2b791-c732-4f0f-96f7-571a1c52d696_0_">0.499022 0.190361 0.503396 0.189638 0.503509 0.311436 0.499096 0.31216 0.499022 0.190361</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_dbac8669-836b-4e55-b35f-32fc7262b266">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_dbac8669-836b-4e55-b35f-32fc7262b266_0_">0.508806 0.190711 0.512403 0.189638 0.512469 0.311437 0.508841 0.312511 0.508806 0.190711</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_69fffcf7-e911-4182-aadb-4bbb25732d73">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_69fffcf7-e911-4182-aadb-4bbb25732d73_0_">0.342466 0.191034 0.345692 0.189638 0.345727 0.311445 0.342473 0.312843 0.342466 0.191034</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_f3fc175c-d82c-4e9f-8ca9-e94f503f3127">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_f3fc175c-d82c-4e9f-8ca9-e94f503f3127_0_">0.333358 0.189638 0.338024 0.191235 0.313907 0.312975 0.309198 0.311376 0.333358 0.189638</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_2fb2adc7-a760-409b-910b-c6ef6c1d9a7f">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_2fb2adc7-a760-409b-910b-c6ef6c1d9a7f_0_">0.425477 0.189638 0.430718 0.190909 0.406464 0.31264 0.401174 0.311367 0.425477 0.189638</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c21646e1-1ac6-48d3-8359-49f46ef07a82">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c21646e1-1ac6-48d3-8359-49f46ef07a82_0_">0.643836 0.517348 0.64641 0.506354 0.677337 0.521082 0.643836 0.517348</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_965d0919-924e-4f64-a3e5-635225c178ab">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_965d0919-924e-4f64-a3e5-635225c178ab_0_">0.819604 0.517084 0.78865 0.513824 0.821096 0.506354 0.819604 0.517084</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_1fc6432f-074e-4e5b-ba9d-a971d04e6c5d">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_1fc6432f-074e-4e5b-ba9d-a971d04e6c5d_0_">0.744738 0.518722 0.716243 0.51559 0.717646 0.506354 0.744738 0.518722</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_7e475bdd-9e89-4f26-8f3f-6d146a714c45">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_7e475bdd-9e89-4f26-8f3f-6d146a714c45_0_">0.71205 0.519714 0.682975 0.51657 0.684551 0.506354 0.71205 0.519714</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_9303abb2-9a72-4bfc-8f23-9f700ae5f8c9">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_9303abb2-9a72-4bfc-8f23-9f700ae5f8c9_0_">0.749511 0.51322 0.784684 0.506354 0.782401 0.5168 0.749511 0.51322</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_3c8a1fef-c6ea-46cd-98dc-48bc0ed48ad8">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_3c8a1fef-c6ea-46cd-98dc-48bc0ed48ad8_0_">0.892368 0.512274 0.926313 0.506354 0.924259 0.515751 0.892368 0.512274</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_c78ee996-9661-4368-b03d-2e02e01f3204">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_c78ee996-9661-4368-b03d-2e02e01f3204_0_">0.406331 0.122576 0.449113 9.78E-4 0.491756 0.00678 0.483647 0.030043 0.44426 0.143044 0.401174 0.137233 0.406331 0.122576</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_b9eca0a2-2e09-4569-80cb-4faa9ba9da0e">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_b9eca0a2-2e09-4569-80cb-4faa9ba9da0e_0_">0.580433 0.438905 0.70406 0.452847 0.699184 0.475718 0.575342 0.461773 0.580433 0.438905</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_eac24c19-2416-470e-b631-c5782c25c409">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_eac24c19-2416-470e-b631-c5782c25c409_0_">0.483492 0.212926 0.488151 0.189638 0.493781 0.190547 0.469477 0.312276 0.463796 0.311366 0.483492 0.212926</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_aa6dab82-8e49-4acb-954f-4d35a2caa547">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_aa6dab82-8e49-4acb-954f-4d35a2caa547_0_">0.979342 0.316154 0.982767 0.315738 0.972135 0.405031 0.968689 0.405448 0.979342 0.316154</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
              <app:target uri="#RCID_ed92972a-7994-48ec-b23e-c1b240b100ff">
                <app:TexCoordList>
                  <app:textureCoordinates ring="#RCID_ed92972a-7994-48ec-b23e-c1b240b100ff_0_">0.952503 0.406014 0.947162 0.405042 0.957928 0.315738 0.963235 0.31671 0.952503 0.406014</app:textureCoordinates>
                </app:TexCoordList>
              </app:target>
            </app:ParameterizedTexture>
          </app:surfaceDataMember>
        </app:Appearance>
      </app:appearance>
      <bldg:yearOfConstruction>1980</bldg:yearOfConstruction>
      <bldg:lod1Solid>
        <gml:Solid gml:id="ID_2f4dcb3c-39a1-4fe5-bf6a-df9fd126d0be">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_0e7e4cc8-04a5-4b2f-a928-e705450b5b7f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9acf6419-3af4-4a12-9f5b-e2516d61f08d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9acf6419-3af4-4a12-9f5b-e2516d61f08d_0_">
                      <gml:posList srsDimension="3">92865.35 436838.86 2.57850000000051 92864.99 436838.76 2.57850000000051 92864.99 436838.76 19.725 92865.35 436838.86 19.725 92865.35 436838.86 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_59677bc9-41d1-4899-9eb9-b66c250ddd9c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_59677bc9-41d1-4899-9eb9-b66c250ddd9c_0_">
                      <gml:posList srsDimension="3">92864.99 436838.76 2.57850000000051 92859.68 436837.07 2.57850000000051 92859.68 436837.07 19.725 92864.99 436838.76 19.725 92864.99 436838.76 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a304ea0b-ae66-4eeb-9853-d9fb811be7ad">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a304ea0b-ae66-4eeb-9853-d9fb811be7ad_0_">
                      <gml:posList srsDimension="3">92859.68 436837.07 2.57850000000051 92859.579 436837.307 2.57850000000051 92859.579 436837.307 19.725 92859.68 436837.07 19.725 92859.68 436837.07 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_487f97b4-4996-49c0-aa8d-eadc5efcb4f4">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_487f97b4-4996-49c0-aa8d-eadc5efcb4f4_0_">
                      <gml:posList srsDimension="3">92859.579 436837.307 2.57850000000051 92859.439 436837.524 2.57850000000051 92859.439 436837.524 19.725 92859.579 436837.307 19.725 92859.579 436837.307 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_afda66eb-a0b0-4223-a252-cd7c2d3d264b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_afda66eb-a0b0-4223-a252-cd7c2d3d264b_0_">
                      <gml:posList srsDimension="3">92859.439 436837.524 2.57850000000051 92859.264 436837.714 2.57850000000051 92859.264 436837.714 19.725 92859.439 436837.524 19.725 92859.439 436837.524 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e48b64b1-5492-4eb8-a654-f88114cd1606">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e48b64b1-5492-4eb8-a654-f88114cd1606_0_">
                      <gml:posList srsDimension="3">92859.264 436837.714 2.57850000000051 92859.059 436837.871 2.57850000000051 92859.059 436837.871 19.725 92859.264 436837.714 19.725 92859.264 436837.714 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e888727b-d776-474e-9521-ebfed672ff3e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e888727b-d776-474e-9521-ebfed672ff3e_0_">
                      <gml:posList srsDimension="3">92859.059 436837.871 2.57850000000051 92858.831 436837.991 2.57850000000051 92858.831 436837.991 19.725 92859.059 436837.871 19.725 92859.059 436837.871 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_05f0c488-85f5-499e-8d2e-95ad213689a5">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_05f0c488-85f5-499e-8d2e-95ad213689a5_0_">
                      <gml:posList srsDimension="3">92858.831 436837.991 2.57850000000051 92858.585 436838.071 2.57850000000051 92858.585 436838.071 19.725 92858.831 436837.991 19.725 92858.831 436837.991 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8aed0332-a30a-4a70-804b-e6e5ff0ddc8c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8aed0332-a30a-4a70-804b-e6e5ff0ddc8c_0_">
                      <gml:posList srsDimension="3">92858.585 436838.071 2.57850000000051 92858.33 436838.107 2.57850000000051 92858.33 436838.107 19.725 92858.585 436838.071 19.725 92858.585 436838.071 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ac3f69d6-de38-430d-8e83-bacbf9808954">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ac3f69d6-de38-430d-8e83-bacbf9808954_0_">
                      <gml:posList srsDimension="3">92858.33 436838.107 2.57850000000051 92858.072 436838.1 2.57850000000051 92858.072 436838.1 19.725 92858.33 436838.107 19.725 92858.33 436838.107 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7e5cfc8d-87ab-41ea-b7a1-cccc527b1c0f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7e5cfc8d-87ab-41ea-b7a1-cccc527b1c0f_0_">
                      <gml:posList srsDimension="3">92858.072 436838.1 2.57850000000051 92857.819 436838.048 2.57850000000051 92857.819 436838.048 19.725 92858.072 436838.1 19.725 92858.072 436838.1 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_08ee56e8-1902-45f0-9d00-72e862c75092">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_08ee56e8-1902-45f0-9d00-72e862c75092_0_">
                      <gml:posList srsDimension="3">92857.819 436838.048 2.57850000000051 92857.578 436837.955 2.57850000000051 92857.578 436837.955 19.725 92857.819 436838.048 19.725 92857.819 436838.048 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_78650da5-8766-4b52-9544-0998082b70d1">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_78650da5-8766-4b52-9544-0998082b70d1_0_">
                      <gml:posList srsDimension="3">92857.578 436837.955 2.57850000000051 92857.357 436837.822 2.57850000000051 92857.357 436837.822 19.725 92857.578 436837.955 19.725 92857.578 436837.955 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_49085d1c-816b-4cf6-995c-6c492b6835eb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_49085d1c-816b-4cf6-995c-6c492b6835eb_0_">
                      <gml:posList srsDimension="3">92857.357 436837.822 2.57850000000051 92857.162 436837.653 2.57850000000051 92857.162 436837.653 19.725 92857.357 436837.822 19.725 92857.357 436837.822 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7d1dea78-09d7-488f-b552-93c2a66f7710">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7d1dea78-09d7-488f-b552-93c2a66f7710_0_">
                      <gml:posList srsDimension="3">92857.162 436837.653 2.57850000000051 92856.998 436837.454 2.57850000000051 92856.998 436837.454 19.725 92857.162 436837.653 19.725 92857.162 436837.653 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b1cd760a-d332-46b8-93b6-3bf5d54f45bd">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b1cd760a-d332-46b8-93b6-3bf5d54f45bd_0_">
                      <gml:posList srsDimension="3">92856.998 436837.454 2.57850000000051 92856.87 436837.229 2.57850000000051 92856.87 436837.229 19.725 92856.998 436837.454 19.725 92856.998 436837.454 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_901f3498-cab1-4945-b557-56d895089cc2">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_901f3498-cab1-4945-b557-56d895089cc2_0_">
                      <gml:posList srsDimension="3">92856.87 436837.229 2.57850000000051 92856.783 436836.987 2.57850000000051 92856.783 436836.987 19.725 92856.87 436837.229 19.725 92856.87 436837.229 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d8522108-41d8-4fa0-bac7-3a60bc30cfeb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d8522108-41d8-4fa0-bac7-3a60bc30cfeb_0_">
                      <gml:posList srsDimension="3">92856.783 436836.987 2.57850000000051 92856.738 436836.733 2.57850000000051 92856.738 436836.733 19.725 92856.783 436836.987 19.725 92856.783 436836.987 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0a8fa75f-b109-4cb8-b61b-6d9502cbaea0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0a8fa75f-b109-4cb8-b61b-6d9502cbaea0_0_">
                      <gml:posList srsDimension="3">92856.738 436836.733 2.57850000000051 92856.737 436836.474 2.57850000000051 92856.737 436836.474 19.725 92856.738 436836.733 19.725 92856.738 436836.733 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e1d25b52-cdfe-466f-b91e-44de54e3931b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e1d25b52-cdfe-466f-b91e-44de54e3931b_0_">
                      <gml:posList srsDimension="3">92856.78 436836.22 19.725 92856.737 436836.474 19.725 92856.737 436836.474 2.57850000000051 92856.78 436836.22 2.57850000000051 92856.78 436836.22 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_593a92ef-3378-4ec7-91e2-bc58ff975343">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_593a92ef-3378-4ec7-91e2-bc58ff975343_0_">
                      <gml:posList srsDimension="3">92856.78 436836.22 2.57850000000051 92855.09 436835.6 2.57850000000051 92855.09 436835.6 19.725 92856.78 436836.22 19.725 92856.78 436836.22 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_398fa66c-ea51-4ac9-bd79-5f724b931701">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_398fa66c-ea51-4ac9-bd79-5f724b931701_0_">
                      <gml:posList srsDimension="3">92855.09 436835.6 2.57850000000051 92849.78 436833.9 2.57850000000051 92849.78 436833.9 19.725 92855.09 436835.6 19.725 92855.09 436835.6 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_dc0c5289-fd6e-44cb-a6ba-7ed64a6efc17">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_dc0c5289-fd6e-44cb-a6ba-7ed64a6efc17_0_">
                      <gml:posList srsDimension="3">92853.05 436823.73 19.725 92849.78 436833.9 19.725 92849.78 436833.9 2.57850000000051 92853.05 436823.73 2.57850000000051 92853.05 436823.73 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6c0505ca-3e3c-4943-9f35-2f9ecc54e264">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6c0505ca-3e3c-4943-9f35-2f9ecc54e264_0_">
                      <gml:posList srsDimension="3">92853.25 436823.09 19.725 92853.05 436823.73 19.725 92853.05 436823.73 2.57850000000051 92853.25 436823.09 2.57850000000051 92853.25 436823.09 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9a6ad7da-e264-4447-b7fb-06c72ded31cc">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9a6ad7da-e264-4447-b7fb-06c72ded31cc_0_">
                      <gml:posList srsDimension="3">92853.25 436823.09 2.57850000000051 92853.2 436822.92 2.57850000000051 92853.2 436822.92 19.725 92853.25 436823.09 19.725 92853.25 436823.09 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a2c3b4eb-3123-455f-b8b1-1e26090f9625">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a2c3b4eb-3123-455f-b8b1-1e26090f9625_0_">
                      <gml:posList srsDimension="3">92853.32 436822.67 19.725 92853.2 436822.92 19.725 92853.2 436822.92 2.57850000000051 92853.32 436822.67 2.57850000000051 92853.32 436822.67 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_78672f95-c70b-448d-8882-a2485fb232f0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_78672f95-c70b-448d-8882-a2485fb232f0_0_">
                      <gml:posList srsDimension="3">92868.57 436827.485 19.725 92853.32 436822.67 19.725 92853.32 436822.67 2.57850000000051 92868.57 436827.485 2.57850000000051 92868.57 436827.485 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_29bb09d7-2e6c-46fb-aebf-d1460064c40a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_29bb09d7-2e6c-46fb-aebf-d1460064c40a_0_">
                      <gml:posList srsDimension="3">92871.588 436828.438 19.725 92868.57 436827.485 19.725 92868.57 436827.485 2.57850000000051 92871.588 436828.438 2.57850000000051 92871.588 436828.438 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9cf5c5a2-3bbf-4e1f-b856-0923b23f5086">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9cf5c5a2-3bbf-4e1f-b856-0923b23f5086_0_">
                      <gml:posList srsDimension="3">92871.588 436828.438 2.57850000000051 92867.95 436839.69 2.57850000000051 92867.95 436839.69 19.725 92871.588 436828.438 19.725 92871.588 436828.438 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6e3e217b-9c4c-46b9-a459-91b5f4e2021d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6e3e217b-9c4c-46b9-a459-91b5f4e2021d_0_">
                      <gml:posList srsDimension="3">92867.95 436839.69 2.57850000000051 92865.35 436838.86 2.57850000000051 92865.35 436838.86 19.725 92867.95 436839.69 19.725 92867.95 436839.69 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7f8cbc04-d726-4e54-829e-b71538225861">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7f8cbc04-d726-4e54-829e-b71538225861_0_">
                      <gml:posList srsDimension="3">92858.585 436838.071 19.725 92858.33 436838.107 19.725 92858.072 436838.1 19.725 92857.819 436838.048 19.725 92857.578 436837.955 19.725 92857.357 436837.822 19.725 92857.162 436837.653 19.725 92856.998 436837.454 19.725 92856.87 436837.229 19.725 92856.783 436836.987 19.725 92856.738 436836.733 19.725 92856.737 436836.474 19.725 92856.78 436836.22 19.725 92855.09 436835.6 19.725 92849.78 436833.9 19.725 92853.05 436823.73 19.725 92853.25 436823.09 19.725 92853.2 436822.92 19.725 92853.32 436822.67 19.725 92868.57 436827.485 19.725 92871.588 436828.438 19.725 92867.95 436839.69 19.725 92865.35 436838.86 19.725 92864.99 436838.76 19.725 92859.68 436837.07 19.725 92859.579 436837.307 19.725 92859.439 436837.524 19.725 92859.264 436837.714 19.725 92859.059 436837.871 19.725 92858.831 436837.991 19.725 92858.585 436838.071 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_01bb3176-fe54-47c9-b962-95a73fb03605">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_01bb3176-fe54-47c9-b962-95a73fb03605_0_">
                      <gml:posList srsDimension="3">92858.831 436837.991 2.57850000000051 92859.059 436837.871 2.57850000000051 92859.264 436837.714 2.57850000000051 92859.439 436837.524 2.57850000000051 92859.579 436837.307 2.57850000000051 92859.68 436837.07 2.57850000000051 92864.99 436838.76 2.57850000000051 92865.35 436838.86 2.57850000000051 92867.95 436839.69 2.57850000000051 92871.588 436828.438 2.57850000000051 92868.57 436827.485 2.57850000000051 92853.32 436822.67 2.57850000000051 92853.2 436822.92 2.57850000000051 92853.25 436823.09 2.57850000000051 92853.05 436823.73 2.57850000000051 92849.78 436833.9 2.57850000000051 92855.09 436835.6 2.57850000000051 92856.78 436836.22 2.57850000000051 92856.737 436836.474 2.57850000000051 92856.738 436836.733 2.57850000000051 92856.783 436836.987 2.57850000000051 92856.87 436837.229 2.57850000000051 92856.998 436837.454 2.57850000000051 92857.162 436837.653 2.57850000000051 92857.357 436837.822 2.57850000000051 92857.578 436837.955 2.57850000000051 92857.819 436838.048 2.57850000000051 92858.072 436838.1 2.57850000000051 92858.33 436838.107 2.57850000000051 92858.585 436838.071 2.57850000000051 92858.831 436837.991 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod1Solid>
      <bldg:lod2Solid>
        <gml:Solid gml:id="UUID_41a58c77-d715-4cc9-acba-77e15da4bc7b">
          <gml:exterior>
            <gml:CompositeSurface gml:id="UUID_27e013ee-96f4-4231-803e-786eec2ee0c9">
              <gml:surfaceMember xlink:href="#RCID_2f909185-ff6b-4136-a279-9637cfa45d75"/>
              <gml:surfaceMember xlink:href="#RCID_e46e6020-63eb-435b-95db-0affd8aad3b8"/>
              <gml:surfaceMember xlink:href="#RCID_55163e44-8fa9-44aa-b966-5367e66a8894"/>
              <gml:surfaceMember xlink:href="#RCID_0ecced3c-aa16-4f45-b9e7-f3ba59070d1f"/>
              <gml:surfaceMember xlink:href="#RCID_8e7491b1-e490-4746-8bda-1064c5da296d"/>
              <gml:surfaceMember xlink:href="#RCID_2afd5dc1-69b7-443a-bcb4-2a7839cd4bdc"/>
              <gml:surfaceMember xlink:href="#RCID_a22c043a-6077-4110-8537-164f06d43c0b"/>
              <gml:surfaceMember xlink:href="#RCID_1f4af2ea-38d6-4b38-9992-8331d9ff4714"/>
              <gml:surfaceMember xlink:href="#RCID_ef3684d0-1140-4c64-9bdd-849ddd15a0a0"/>
              <gml:surfaceMember xlink:href="#RCID_97585603-118b-4ee5-a225-b8ce15f98d9d"/>
              <gml:surfaceMember xlink:href="#RCID_62c6703d-c08c-4288-891f-99d68db668f3"/>
              <gml:surfaceMember xlink:href="#RCID_29908dc2-7a5b-45bb-a675-1889770b7734"/>
              <gml:surfaceMember xlink:href="#RCID_d783e4e6-00c0-47aa-a758-26180b38b9f0"/>
              <gml:surfaceMember xlink:href="#RCID_f7bf8fb7-c5d8-41f4-9cfe-a5432e451c9d"/>
              <gml:surfaceMember xlink:href="#RCID_6f72899f-1b1e-451c-9199-39c412d75e5f"/>
              <gml:surfaceMember xlink:href="#RCID_9ef8c477-cc96-42c8-8185-0ba9fbf6dda0"/>
              <gml:surfaceMember xlink:href="#RCID_77aee94c-52e0-479d-afaf-15d064d818e0"/>
              <gml:surfaceMember xlink:href="#RCID_e4bed554-48a7-463c-b300-2440c491f407"/>
              <gml:surfaceMember xlink:href="#RCID_9c7df768-6ff9-4ba7-bb85-e5b09dff6c7c"/>
              <gml:surfaceMember xlink:href="#RCID_9e8650dd-0117-46a1-a146-de3f7bbdd61c"/>
              <gml:surfaceMember xlink:href="#RCID_df840330-16e3-4c74-94d7-e2522f33c5fa"/>
              <gml:surfaceMember xlink:href="#RCID_f6f71cfc-d24c-484f-9375-5db4989e0aa4"/>
              <gml:surfaceMember xlink:href="#RCID_a2b2e5bc-c1b4-490d-b7db-4217148fe85d"/>
              <gml:surfaceMember xlink:href="#RCID_516178fb-28cf-4aa2-8915-a264eb676e34"/>
              <gml:surfaceMember xlink:href="#RCID_80caa148-7485-4d66-b488-af69a583783a"/>
              <gml:surfaceMember xlink:href="#RCID_c0b9ca0d-681a-4799-bc63-9150bbefa616"/>
              <gml:surfaceMember xlink:href="#RCID_8bba7f35-e02f-4769-90b6-23317b5f7b1e"/>
              <gml:surfaceMember xlink:href="#RCID_de9d4853-c547-4719-9731-e49697f1448a"/>
              <gml:surfaceMember xlink:href="#RCID_007fa201-bf97-4b18-8a1d-e6480d9cb297"/>
              <gml:surfaceMember xlink:href="#RCID_45de4898-9bbb-459c-86da-cd741cdba270"/>
              <gml:surfaceMember xlink:href="#RCID_12e49e26-e0bd-40ba-9803-c35e760afae1"/>
              <gml:surfaceMember xlink:href="#RCID_cbbfaf36-c871-49c8-b293-ea49e8f4e4e3"/>
              <gml:surfaceMember xlink:href="#RCID_b979062f-7864-4f86-8b24-77782be8c017"/>
              <gml:surfaceMember xlink:href="#RCID_21f5b59b-2da3-48d7-a2ea-2568e667e2ce"/>
              <gml:surfaceMember xlink:href="#RCID_0a101672-4f72-4bb7-8186-3787b3c145ae"/>
              <gml:surfaceMember xlink:href="#RCID_5363a890-ef24-458c-b8ad-3715c39ef891"/>
              <gml:surfaceMember xlink:href="#RCID_6ac8bb08-4088-445e-9d56-5d08ab0d0764"/>
              <gml:surfaceMember xlink:href="#RCID_61687175-5d6e-4d49-a309-50a0a6244eff"/>
              <gml:surfaceMember xlink:href="#RCID_181a6562-9337-427c-82c7-7351aa50a5df"/>
              <gml:surfaceMember xlink:href="#RCID_654e02de-cdaf-4a9d-bd01-b0aa49713118"/>
              <gml:surfaceMember xlink:href="#RCID_29199e93-63b1-4993-9128-fb2e1583bcbb"/>
              <gml:surfaceMember xlink:href="#RCID_f5b6b5c5-143b-421e-aefb-cf5fa0080879"/>
              <gml:surfaceMember xlink:href="#RCID_b580f0de-ca88-4f45-8847-2f895f2f3e02"/>
              <gml:surfaceMember xlink:href="#RCID_97cba3f3-a10d-4e9a-867b-b1942b510a4b"/>
              <gml:surfaceMember xlink:href="#RCID_2190ddfd-f72c-4870-b6e3-bb0186497ab1"/>
              <gml:surfaceMember xlink:href="#RCID_1bba28a3-8999-490b-ac9e-d7d5438d9ff4"/>
              <gml:surfaceMember xlink:href="#RCID_45fb137d-ceba-436b-9492-cf3ec922bf81"/>
              <gml:surfaceMember xlink:href="#RCID_39fd486f-edcb-4721-a25f-5b870b3ac3a0"/>
              <gml:surfaceMember xlink:href="#RCID_57f57ac6-e019-4f5e-91ac-a510e7ce6442"/>
              <gml:surfaceMember xlink:href="#RCID_59b75d4c-8c90-4c30-9cf8-d1b5cefe8091"/>
              <gml:surfaceMember xlink:href="#RCID_1311acea-7e35-4ab7-88be-332daa314d3a"/>
              <gml:surfaceMember xlink:href="#RCID_029612df-36ba-48db-b8fd-0324309a731c"/>
              <gml:surfaceMember xlink:href="#RCID_4b9c630d-9f7b-4c7c-aba4-5265279cf65f"/>
              <gml:surfaceMember xlink:href="#RCID_ffc2b791-c732-4f0f-96f7-571a1c52d696"/>
              <gml:surfaceMember xlink:href="#RCID_dbac8669-836b-4e55-b35f-32fc7262b266"/>
              <gml:surfaceMember xlink:href="#RCID_69fffcf7-e911-4182-aadb-4bbb25732d73"/>
              <gml:surfaceMember xlink:href="#RCID_f3fc175c-d82c-4e9f-8ca9-e94f503f3127"/>
              <gml:surfaceMember xlink:href="#RCID_2fb2adc7-a760-409b-910b-c6ef6c1d9a7f"/>
              <gml:surfaceMember xlink:href="#RCID_c21646e1-1ac6-48d3-8359-49f46ef07a82"/>
              <gml:surfaceMember xlink:href="#RCID_965d0919-924e-4f64-a3e5-635225c178ab"/>
              <gml:surfaceMember xlink:href="#RCID_1fc6432f-074e-4e5b-ba9d-a971d04e6c5d"/>
              <gml:surfaceMember xlink:href="#RCID_7e475bdd-9e89-4f26-8f3f-6d146a714c45"/>
              <gml:surfaceMember xlink:href="#RCID_9303abb2-9a72-4bfc-8f23-9f700ae5f8c9"/>
              <gml:surfaceMember xlink:href="#RCID_3c8a1fef-c6ea-46cd-98dc-48bc0ed48ad8"/>
              <gml:surfaceMember xlink:href="#RCID_c78ee996-9661-4368-b03d-2e02e01f3204"/>
              <gml:surfaceMember xlink:href="#RCID_b9eca0a2-2e09-4569-80cb-4faa9ba9da0e"/>
              <gml:surfaceMember xlink:href="#RCID_eac24c19-2416-470e-b631-c5782c25c409"/>
              <gml:surfaceMember xlink:href="#RCID_aa6dab82-8e49-4acb-954f-4d35a2caa547"/>
              <gml:surfaceMember xlink:href="#RCID_ed92972a-7994-48ec-b23e-c1b240b100ff"/>
            </gml:CompositeSurface>
          </gml:exterior>
        </gml:Solid>
      </bldg:lod2Solid>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_a52c453b-e30f-4842-9d6c-1ea4a7b855fe">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_327179c1-10eb-44d2-8a96-07da2b687ca5">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e46e6020-63eb-435b-95db-0affd8aad3b8">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e46e6020-63eb-435b-95db-0affd8aad3b8_0_">
                      <gml:posList srsDimension="3">92861.5422485104 436826.801265957 19.725 92859.6125844401 436826.191998253 19.725 92860.0533612895 436824.79597604 18.28125 92861.9830253599 436825.405243745 18.2812500000807 92861.5422485104 436826.801265957 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:GroundSurface gml:id="UUID_f680b524-0eed-4332-b6c1-20578b373a8e">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2cc1d77a-6120-4db4-a374-0ca69edbbe4f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2f909185-ff6b-4136-a279-9637cfa45d75">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2f909185-ff6b-4136-a279-9637cfa45d75_0_">
                      <gml:posList srsDimension="3">92858.072 436838.1 2.57850000000051 92858.33 436838.107 2.57850000000051 92858.585 436838.071 2.57850000000051 92858.831 436837.991 2.57850000000051 92859.059 436837.871 2.57850000000051 92859.264 436837.714 2.57850000000051 92859.439 436837.524 2.57850000000051 92859.579 436837.307 2.57850000000051 92859.6799999997 436837.07 2.57850000000051 92861.2699999995 436832.059999999 2.57850000000051 92856.6999999993 436830.600000001 2.57850000000051 92855.0899999999 436835.600000001 2.57850000000051 92856.78 436836.22 2.57850000000051 92856.737 436836.474 2.57850000000051 92856.738 436836.733 2.57850000000051 92856.783 436836.987 2.57850000000051 92856.87 436837.229 2.57850000000051 92856.998 436837.454 2.57850000000051 92857.162 436837.653 2.57850000000051 92857.357 436837.822 2.57850000000051 92857.578 436837.955 2.57850000000051 92857.819 436838.048 2.57850000000051 92858.072 436838.1 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:GroundSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_091858e3-8b48-4d67-a55c-845b263a99f9">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_8296851d-783a-4f88-b7f9-1bc3b5a49efb">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c78ee996-9661-4368-b03d-2e02e01f3204">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c78ee996-9661-4368-b03d-2e02e01f3204_0_">
                      <gml:posList srsDimension="3">92856.78 436836.22 17.896875 92856.78 436836.22 2.57850000000051 92855.0899999999 436835.600000001 2.57850000000051 92855.0899999999 436835.600000001 5.53000000000002 92855.0899999999 436835.600000001 19.725 92856.78 436836.22 19.725 92856.78 436836.22 17.896875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_a5119f34-c876-49cd-ac72-a50daa8cfb4a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_d8a2cbbd-aa62-44a3-9f19-5b507a747f23">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_aa6dab82-8e49-4acb-954f-4d35a2caa547">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_aa6dab82-8e49-4acb-954f-4d35a2caa547_0_">
                      <gml:posList srsDimension="3">92853.25 436823.09 5.53000000000002 92853.1999999993 436822.920000002 5.53000000000002 92853.2 436822.92 16.7578125 92853.25 436823.09 16.7578125 92853.25 436823.09 5.53000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_985b2814-97c2-43bc-bc30-05e6114bdf48">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_060db836-df66-4490-b6c2-b76c5e3ddb42">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ed92972a-7994-48ec-b23e-c1b240b100ff">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ed92972a-7994-48ec-b23e-c1b240b100ff_0_">
                      <gml:posList srsDimension="3">92853.32 436822.67 16.7578125 92853.2 436822.92 16.7578125 92853.1999999993 436822.920000002 5.53000000000002 92853.3200000003 436822.670000002 5.53000000000002 92853.32 436822.67 16.7578125</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_7e03c0b0-1d04-4f99-b7ba-6064f79083a7">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_f36abe58-f833-4a1e-99bd-ccc6905aed94">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_3c8a1fef-c6ea-46cd-98dc-48bc0ed48ad8">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_3c8a1fef-c6ea-46cd-98dc-48bc0ed48ad8_0_">
                      <gml:posList srsDimension="3">92864.2015316406 436837.046352316 19.725 92863.7788189674 436838.374520538 18.4470094847355 92863.7788189674 436838.374520538 19.725 92864.2015316406 436837.046352316 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_b962b31a-5045-4daa-8875-4bd06c83df0d">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_18624794-f02b-43c5-9811-68ad76e4dfab">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1bba28a3-8999-490b-ac9e-d7d5438d9ff4">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1bba28a3-8999-490b-ac9e-d7d5438d9ff4_0_">
                      <gml:posList srsDimension="3">92856.998 436837.454 2.57850000000051 92856.87 436837.229 2.57850000000051 92856.87 436837.229 17.896875 92856.998 436837.454 17.896875 92856.998 436837.454 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_ae331b26-87f9-47cd-9002-5ae22b1ee71c">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c17f54f8-b0e5-46ac-8d68-58c15ba23cd0">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9303abb2-9a72-4bfc-8f23-9f700ae5f8c9">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9303abb2-9a72-4bfc-8f23-9f700ae5f8c9_0_">
                      <gml:posList srsDimension="3">92857.6732095132 436834.987096825 19.725 92857.2382182768 436836.36194275 18.3168555749799 92857.2382182768 436836.36194275 19.725 92857.6732095132 436834.987096825 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_c689fa51-faac-451b-b42c-abe4b7f8b1b7">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_34be87e1-35b6-42a7-9512-0c6879b676ca">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_7e475bdd-9e89-4f26-8f3f-6d146a714c45">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_7e475bdd-9e89-4f26-8f3f-6d146a714c45_0_">
                      <gml:posList srsDimension="3">92861.1917896106 436836.100349939 19.725 92860.7747598239 436837.418426385 19.725 92860.7747598239 436837.418426385 18.375 92861.1917896106 436836.100349939 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_5a500805-21d1-4173-bf7f-8dd8d298898f">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_b8b3ff1a-55e6-4197-a1b3-bf21ff2b342a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1fc6432f-074e-4e5b-ba9d-a971d04e6c5d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1fc6432f-074e-4e5b-ba9d-a971d04e6c5d_0_">
                      <gml:posList srsDimension="3">92851.4569110101 436833.019507029 19.725 92851.0437165562 436834.304579688 19.725 92851.0437165562 436834.304579688 18.4983871952715 92851.4569110101 436833.019507029 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_7a43aa79-5cfa-45ab-b1df-705eec2fed96">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_c3288747-9d13-4db0-864e-cbf564ba042c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_965d0919-924e-4f64-a3e5-635225c178ab">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_965d0919-924e-4f64-a3e5-635225c178ab_0_">
                      <gml:posList srsDimension="3">92861.98302536 436825.405243745 19.725 92861.5422485104 436826.801265957 19.725 92861.9830253599 436825.405243745 18.2812500000807 92861.98302536 436825.405243745 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_20061c0a-a953-45f5-932c-ecbc060e82fe">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_13c3a5f3-efdf-4c63-afe4-e7652f683cc5">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c21646e1-1ac6-48d3-8359-49f46ef07a82">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c21646e1-1ac6-48d3-8359-49f46ef07a82_0_">
                      <gml:posList srsDimension="3">92860.0533612896 436824.79597604 19.725 92860.0533612895 436824.79597604 18.28125 92859.6125844401 436826.191998253 19.725 92860.0533612896 436824.79597604 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_556482c7-c5cc-4a34-be70-bc30342dcfab">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_93b38b15-807d-42a4-a0e8-9ac53aa7803e">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2fb2adc7-a760-409b-910b-c6ef6c1d9a7f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2fb2adc7-a760-409b-910b-c6ef6c1d9a7f_0_">
                      <gml:posList srsDimension="3">92859.579 436837.307 2.57850000000051 92859.439 436837.524 2.57850000000051 92859.439 436837.524 17.896875 92859.579 436837.307 17.896875 92859.579 436837.307 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_3291777c-5ee1-4ad1-b44d-2c8a1d12aac2">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_82296d0d-9e52-4838-b104-0ce6a8608289">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f3fc175c-d82c-4e9f-8ca9-e94f503f3127">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f3fc175c-d82c-4e9f-8ca9-e94f503f3127_0_">
                      <gml:posList srsDimension="3">92859.439 436837.524 2.57850000000051 92859.264 436837.714 2.57850000000051 92859.264 436837.714 17.896875 92859.439 436837.524 17.896875 92859.439 436837.524 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_40970d01-8bc0-4358-94f5-c6e6f65364f2">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_16adeee2-71d2-4111-8116-a8c8bd0572a8">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_69fffcf7-e911-4182-aadb-4bbb25732d73">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_69fffcf7-e911-4182-aadb-4bbb25732d73_0_">
                      <gml:posList srsDimension="3">92859.264 436837.714 2.57850000000051 92859.059 436837.871 2.57850000000051 92859.059 436837.871 17.896875 92859.264 436837.714 17.896875 92859.264 436837.714 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_9999b515-a55f-422c-aeb4-c4cb35ffae31">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_85925b4d-8ff8-4074-8d84-f119dbbd7c35">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_dbac8669-836b-4e55-b35f-32fc7262b266">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_dbac8669-836b-4e55-b35f-32fc7262b266_0_">
                      <gml:posList srsDimension="3">92859.059 436837.871 2.57850000000051 92858.831 436837.991 2.57850000000051 92858.831 436837.991 17.896875 92859.059 436837.871 17.896875 92859.059 436837.871 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_1c25f9f5-d065-4122-ab36-5433e63f0a23">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_066cd416-96d3-4976-8dbb-2c672f9245c6">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ffc2b791-c732-4f0f-96f7-571a1c52d696">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ffc2b791-c732-4f0f-96f7-571a1c52d696_0_">
                      <gml:posList srsDimension="3">92858.831 436837.991 2.57850000000051 92858.585 436838.071 2.57850000000051 92858.585 436838.071 17.896875 92858.831 436837.991 17.896875 92858.831 436837.991 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_4c0eb91c-870c-48be-a604-75d3dc1a1a84">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_f6c90c7c-3aa1-4115-bec9-4fe7ed5ea711">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_4b9c630d-9f7b-4c7c-aba4-5265279cf65f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_4b9c630d-9f7b-4c7c-aba4-5265279cf65f_0_">
                      <gml:posList srsDimension="3">92858.585 436838.071 2.57850000000051 92858.33 436838.107 2.57850000000051 92858.33 436838.107 17.896875 92858.585 436838.071 17.896875 92858.585 436838.071 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_94333928-4fa5-47e1-a358-cdc48237a5d5">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_1c7a4dd9-39d2-4d82-bc02-9ca340faca72">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_029612df-36ba-48db-b8fd-0324309a731c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_029612df-36ba-48db-b8fd-0324309a731c_0_">
                      <gml:posList srsDimension="3">92858.33 436838.107 2.57850000000051 92858.072 436838.1 2.57850000000051 92858.072 436838.1 17.896875 92858.33 436838.107 17.896875 92858.33 436838.107 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_1f55c21d-897e-470f-9184-51314d05621f">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_17e02516-7b12-4e31-88c6-d2193d34979c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1311acea-7e35-4ab7-88be-332daa314d3a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1311acea-7e35-4ab7-88be-332daa314d3a_0_">
                      <gml:posList srsDimension="3">92858.072 436838.1 2.57850000000051 92857.819 436838.048 2.57850000000051 92857.819 436838.048 17.896875 92858.072 436838.1 17.896875 92858.072 436838.1 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_f64f6ed6-ca87-44f9-8809-8ea842884cc7">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_ade0dce8-917f-47f1-b99c-70232b77e9e2">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_59b75d4c-8c90-4c30-9cf8-d1b5cefe8091">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_59b75d4c-8c90-4c30-9cf8-d1b5cefe8091_0_">
                      <gml:posList srsDimension="3">92857.819 436838.048 2.57850000000051 92857.578 436837.955 2.57850000000051 92857.578 436837.955 17.896875 92857.819 436838.048 17.896875 92857.819 436838.048 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_966d0845-20ab-4c0d-9a73-65154317933d">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_87c18d74-259c-4217-9ba9-97315a5bdc5e">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_57f57ac6-e019-4f5e-91ac-a510e7ce6442">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_57f57ac6-e019-4f5e-91ac-a510e7ce6442_0_">
                      <gml:posList srsDimension="3">92857.578 436837.955 2.57850000000051 92857.357 436837.822 2.57850000000051 92857.357 436837.822 17.896875 92857.578 436837.955 17.896875 92857.578 436837.955 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_6d820d8c-8949-4c4e-bb60-9ef7fe2df3f6">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_28a7daae-2ac3-4cc1-b226-94b2f3284e99">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_39fd486f-edcb-4721-a25f-5b870b3ac3a0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_39fd486f-edcb-4721-a25f-5b870b3ac3a0_0_">
                      <gml:posList srsDimension="3">92857.357 436837.822 2.57850000000051 92857.162 436837.653 2.57850000000051 92857.162 436837.653 17.896875 92857.357 436837.822 17.896875 92857.357 436837.822 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_74fc8e0e-4640-4ba5-bbc8-b936c304e9c9">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_ad8834c9-ad63-4080-ba75-dc7e50287e31">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_45fb137d-ceba-436b-9492-cf3ec922bf81">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_45fb137d-ceba-436b-9492-cf3ec922bf81_0_">
                      <gml:posList srsDimension="3">92857.162 436837.653 2.57850000000051 92856.998 436837.454 2.57850000000051 92856.998 436837.454 17.896875 92857.162 436837.653 17.896875 92857.162 436837.653 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_94270f7f-036f-4039-ba6d-f4d72b5d27bb">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_765a7156-df68-4ed6-a09d-fbb24313944c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_eac24c19-2416-470e-b631-c5782c25c409">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_eac24c19-2416-470e-b631-c5782c25c409_0_">
                      <gml:posList srsDimension="3">92859.6799999997 436837.07 5.53000000000002 92859.6799999997 436837.07 2.57850000000051 92859.579 436837.307 2.57850000000051 92859.579 436837.307 17.896875 92859.68 436837.07 17.896875 92859.6799999997 436837.07 5.53000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_51764ba7-3c29-4d3a-9093-9d8e2db0af7c">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_302e3baa-3a50-43b9-aaf1-ca7a1a875e4a">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2190ddfd-f72c-4870-b6e3-bb0186497ab1">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2190ddfd-f72c-4870-b6e3-bb0186497ab1_0_">
                      <gml:posList srsDimension="3">92856.87 436837.229 2.57850000000051 92856.783 436836.987 2.57850000000051 92856.783 436836.987 17.896875 92856.87 436837.229 17.896875 92856.87 436837.229 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_8fe71e0a-03d0-47f6-904d-3fcaf5cd1f7a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_e37e86a0-3465-4652-b0fe-d5831b00d0a3">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_97cba3f3-a10d-4e9a-867b-b1942b510a4b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_97cba3f3-a10d-4e9a-867b-b1942b510a4b_0_">
                      <gml:posList srsDimension="3">92856.783 436836.987 2.57850000000051 92856.738 436836.733 2.57850000000051 92856.738 436836.733 17.896875 92856.783 436836.987 17.896875 92856.783 436836.987 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_97a3044f-43fa-48d9-a222-4d5759360790">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_eb531afe-c2f0-4338-9bfc-833e126e37d2">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b580f0de-ca88-4f45-8847-2f895f2f3e02">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b580f0de-ca88-4f45-8847-2f895f2f3e02_0_">
                      <gml:posList srsDimension="3">92856.738 436836.733 2.57850000000051 92856.737 436836.474 2.57850000000051 92856.737 436836.474 17.896875 92856.738 436836.733 17.896875 92856.738 436836.733 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_6b42abf1-2344-462d-931c-ae53fcd72960">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_ecc2105e-b177-40b5-b31d-efba84efefb4">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f5b6b5c5-143b-421e-aefb-cf5fa0080879">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f5b6b5c5-143b-421e-aefb-cf5fa0080879_0_">
                      <gml:posList srsDimension="3">92856.78 436836.22 17.896875 92856.737 436836.474 17.896875 92856.737 436836.474 2.57850000000051 92856.78 436836.22 2.57850000000051 92856.78 436836.22 17.896875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_88f5ffdd-0cad-469d-90a0-1fc016f6925c">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_92735858-0e77-49ce-8d99-5d0c752cdbe1">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_29199e93-63b1-4993-9128-fb2e1583bcbb">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_29199e93-63b1-4993-9128-fb2e1583bcbb_0_">
                      <gml:posList srsDimension="3">92856.6999999993 436830.600000001 5.53000000000002 92855.0899999999 436835.600000001 5.53000000000002 92855.0899999999 436835.600000001 2.57850000000051 92856.6999999993 436830.600000001 2.57850000000051 92856.6999999993 436830.600000001 5.53000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_fe3416ca-3ee0-48e5-b49d-f70587436e78">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_d8fd1ef5-ce77-455a-8494-2ff1f3ae3046">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_654e02de-cdaf-4a9d-bd01-b0aa49713118">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_654e02de-cdaf-4a9d-bd01-b0aa49713118_0_">
                      <gml:posList srsDimension="3">92861.2699999995 436832.059999999 5.53000000000002 92856.6999999993 436830.600000001 5.53000000000002 92856.6999999993 436830.600000001 2.57850000000051 92861.2699999995 436832.059999999 2.57850000000051 92861.2699999995 436832.059999999 5.53000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_4909cfeb-6e98-491d-94e7-1d28710aa688">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_f448a505-b421-4276-b3e7-148e8572a457">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_61687175-5d6e-4d49-a309-50a0a6244eff">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_61687175-5d6e-4d49-a309-50a0a6244eff_0_">
                      <gml:posList srsDimension="3">92865.2902001903 436838.843388942 16.921875 92865.2902001903 436838.843388942 5.53000000000002 92864.9899999983 436838.760000002 5.53000000000002 92864.9899999983 436838.760000002 18.4569188823908 92865.2902001903 436838.843388942 18.459375 92865.2902001903 436838.843388942 16.921875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_181a6562-9337-427c-82c7-7351aa50a5df">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_181a6562-9337-427c-82c7-7351aa50a5df_0_">
                      <gml:posList srsDimension="3">92865.3500000015 436838.859999999 5.53000000000002 92865.2902001903 436838.843388942 5.53000000000002 92865.2902001903 436838.843388942 16.921875 92865.3500000015 436838.859999999 16.921875 92865.3500000015 436838.859999999 5.53000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_81cb6588-770f-484c-8f06-c7178b8f7b6a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_4a185b56-fd59-4d2f-ba0e-f65f8b7abbe0">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6ac8bb08-4088-445e-9d56-5d08ab0d0764">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6ac8bb08-4088-445e-9d56-5d08ab0d0764_0_">
                      <gml:posList srsDimension="3">92867.9499999993 436839.690000001 5.53000000000002 92865.3500000015 436838.859999999 5.53000000000002 92865.3500000015 436838.859999999 16.921875 92867.9499999993 436839.690000001 16.921875 92867.9499999993 436839.690000001 5.53000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d45b56ee-0148-4c49-b22d-9942485511a5">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_d5df2444-39b8-433a-8f51-d235084ea9c8">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_5363a890-ef24-458c-b8ad-3715c39ef891">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_5363a890-ef24-458c-b8ad-3715c39ef891_0_">
                      <gml:posList srsDimension="3">92871.5879999995 436828.438000001 5.53000000000002 92867.9499999993 436839.690000001 5.53000000000002 92867.9499999993 436839.690000001 16.921875 92871.5879999995 436828.438000001 16.921875 92871.5879999995 436828.438000001 5.53000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_ef912580-39f0-4add-a0ba-302cd5e455b1">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2f4bb961-b418-48ad-a95c-7bd47d96fd4f">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_12e49e26-e0bd-40ba-9803-c35e760afae1">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_12e49e26-e0bd-40ba-9803-c35e760afae1_0_">
                      <gml:posList srsDimension="3">92863.7788189674 436838.374520538 18.4470094847355 92863.7788189674 436838.374520538 5.53000000000002 92860.7747598239 436837.418426385 5.53000000000002 92860.7747598239 436837.418426385 18.375 92860.7747598239 436837.418426385 19.725 92863.7788189674 436838.374520538 19.725 92863.7788189674 436838.374520538 18.4470094847355</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_cbbfaf36-c871-49c8-b293-ea49e8f4e4e3">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_cbbfaf36-c871-49c8-b293-ea49e8f4e4e3_0_">
                      <gml:posList srsDimension="3">92860.7747598239 436837.418426385 18.375 92860.7747598239 436837.418426385 5.53000000000002 92859.6799999997 436837.07 5.53000000000002 92859.68 436837.07 17.896875 92859.68 436837.07 18.3769107806768 92860.7747598239 436837.418426385 18.375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b979062f-7864-4f86-8b24-77782be8c017">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b979062f-7864-4f86-8b24-77782be8c017_0_">
                      <gml:posList srsDimension="3">92857.2382182768 436836.36194275 18.3168555749799 92857.2382182768 436836.36194275 17.896875 92856.78 436836.22 17.896875 92856.78 436836.22 19.725 92857.2382182768 436836.36194275 19.725 92857.2382182768 436836.36194275 18.3168555749799</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_21f5b59b-2da3-48d7-a2ea-2568e667e2ce">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_21f5b59b-2da3-48d7-a2ea-2568e667e2ce_0_">
                      <gml:posList srsDimension="3">92864.9899999983 436838.760000002 5.53000000000002 92863.7788189674 436838.374520538 5.53000000000002 92863.7788189674 436838.374520538 18.4470094847355 92864.9899999983 436838.760000002 18.4569188823908 92864.9899999983 436838.760000002 5.53000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0a101672-4f72-4bb7-8186-3787b3c145ae">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0a101672-4f72-4bb7-8186-3787b3c145ae_0_">
                      <gml:posList srsDimension="3">92859.68 436837.07 17.896875 92857.2382182768 436836.36194275 17.896875 92857.2382182768 436836.36194275 18.3168555749799 92859.68 436837.07 18.3769107806768 92859.68 436837.07 17.896875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_d0f22062-3ab4-4be3-b2f2-c3377b4c67e8">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_91028998-595d-4509-878d-c5751ee1d567">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8bba7f35-e02f-4769-90b6-23317b5f7b1e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8bba7f35-e02f-4769-90b6-23317b5f7b1e_0_">
                      <gml:posList srsDimension="3">92853.25 436823.09 16.7578125 92853.05 436823.73 16.7578125 92853.0500000007 436823.73 5.53000000000002 92853.25 436823.09 5.53000000000002 92853.25 436823.09 16.7578125</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_de9d4853-c547-4719-9731-e49697f1448a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_de9d4853-c547-4719-9731-e49697f1448a_0_">
                      <gml:posList srsDimension="3">92852.9268228635 436824.113092195 16.7578125 92852.9268228635 436824.113092195 19.725 92850.1937038492 436832.613343075 19.725 92850.1937038492 436832.613343075 5.53000000000002 92852.9268228635 436824.113092195 5.53000000000002 92852.9268228635 436824.113092195 16.7578125</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_007fa201-bf97-4b18-8a1d-e6480d9cb297">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_007fa201-bf97-4b18-8a1d-e6480d9cb297_0_">
                      <gml:posList srsDimension="3">92853.05 436823.73 16.7578125 92852.9268228635 436824.113092195 16.7578125 92852.9268228635 436824.113092195 5.53000000000002 92853.0500000007 436823.73 5.53000000000002 92853.05 436823.73 16.7578125</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_45de4898-9bbb-459c-86da-cd741cdba270">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_45de4898-9bbb-459c-86da-cd741cdba270_0_">
                      <gml:posList srsDimension="3">92850.1937038492 436832.613343075 19.725 92849.7800000012 436833.899999998 18.496875 92849.7800000012 436833.899999998 5.53000000000002 92850.1937038492 436832.613343075 5.53000000000002 92850.1937038492 436832.613343075 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_cf09f978-c45f-42f0-b879-996d76595f13">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_5a14d1bf-e91b-447c-9e7a-1da73fa557dd">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_80caa148-7485-4d66-b488-af69a583783a">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_80caa148-7485-4d66-b488-af69a583783a_0_">
                      <gml:posList srsDimension="3">92855.0899999999 436835.600000001 19.725 92855.0899999999 436835.600000001 5.53000000000002 92851.0437165562 436834.304579688 5.53000000000002 92851.0437165562 436834.304579688 18.4983871952715 92851.0437165562 436834.304579688 19.725 92855.0899999999 436835.600000001 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_c0b9ca0d-681a-4799-bc63-9150bbefa616">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_c0b9ca0d-681a-4799-bc63-9150bbefa616_0_">
                      <gml:posList srsDimension="3">92851.0437165562 436834.304579688 5.53000000000002 92849.7800000012 436833.899999998 5.53000000000002 92849.7800000012 436833.899999998 18.496875 92851.0437165562 436834.304579688 18.4983871952715 92851.0437165562 436834.304579688 5.53000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_28a49b70-e68b-4197-b0c2-bd7a1705bf5e">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_1d8bc5e8-5119-477c-ae79-bbbab3411f85">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a2b2e5bc-c1b4-490d-b7db-4217148fe85d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a2b2e5bc-c1b4-490d-b7db-4217148fe85d_0_">
                      <gml:posList srsDimension="3">92865.703355618 436837.524333959 16.921875 92865.2902001903 436838.843388942 16.921875 92865.2902001903 436838.843388942 18.459375 92865.703355618 436837.524333959 19.725 92865.703355618 436837.524333959 16.921875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_516178fb-28cf-4aa2-8915-a264eb676e34">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_516178fb-28cf-4aa2-8915-a264eb676e34_0_">
                      <gml:posList srsDimension="3">92868.3716127811 436829.006902513 16.921875 92865.703355618 436837.524333959 16.921875 92865.703355618 436837.524333959 19.725 92868.3716127811 436829.006902513 19.725 92868.3716127811 436829.006902513 16.921875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_424b9883-e5f0-4d74-b4ba-227e2dd32511">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_67c4e58d-10bb-4b63-8ee1-d771e3cca228">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f6f71cfc-d24c-484f-9375-5db4989e0aa4">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f6f71cfc-d24c-484f-9375-5db4989e0aa4_0_">
                      <gml:posList srsDimension="3">92868.3716127811 436829.006902513 19.725 92865.2056048909 436828.015086695 19.725 92865.2056048909 436828.015086695 16.921875 92868.3716127811 436829.006902513 16.921875 92868.3716127811 436829.006902513 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_2cb745af-6c07-41c9-a512-e7b2c2726e8a">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2404783c-0c98-4d91-8d35-3a0ec6b24085">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_df840330-16e3-4c74-94d7-e2522f33c5fa">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_df840330-16e3-4c74-94d7-e2522f33c5fa_0_">
                      <gml:posList srsDimension="3">92865.659542128 436826.566058711 16.921875 92865.2056048909 436828.015086695 16.921875 92865.2056048909 436828.015086695 19.725 92865.659542128 436826.566058711 19.725 92865.659542128 436826.566058711 16.921875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_c25b99fa-0d21-47c9-8a3f-2a6d0ff5afe0">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_ff53045d-8439-4646-ade1-93d2b55b5ddd">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9e8650dd-0117-46a1-a146-de3f7bbdd61c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9e8650dd-0117-46a1-a146-de3f7bbdd61c_0_">
                      <gml:posList srsDimension="3">92856.2852607998 436823.606244639 19.725 92855.8352845068 436825.031403199 19.725 92855.8352845068 436825.031403199 16.7578125 92856.2852607998 436823.606244639 16.7578125 92856.2852607998 436823.606244639 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_5300015a-4b0c-4bc6-9a19-26a436358a0b">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_6259f4c2-668e-4af4-8877-d62779d690bf">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9c7df768-6ff9-4ba7-bb85-e5b09dff6c7c">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9c7df768-6ff9-4ba7-bb85-e5b09dff6c7c_0_">
                      <gml:posList srsDimension="3">92855.8352845068 436825.031403199 19.725 92852.9268228635 436824.113092195 19.725 92852.9268228635 436824.113092195 16.7578125 92855.8352845068 436825.031403199 16.7578125 92855.8352845068 436825.031403199 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_60782e71-1f3c-4984-a52c-6e5cf1d6f19c">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_2db5bd14-108e-4bc7-9a12-c5ce90f58d6c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_d783e4e6-00c0-47aa-a758-26180b38b9f0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_d783e4e6-00c0-47aa-a758-26180b38b9f0_0_">
                      <gml:posList srsDimension="3">92865.659542128 436826.566058711 19.725 92861.98302536 436825.405243745 19.725 92861.9830253599 436825.405243745 18.2812500000807 92861.98302536 436825.405243745 5.53000000000002 92865.659542128 436826.566058711 5.53000000000002 92865.659542128 436826.566058711 16.921875 92865.659542128 436826.566058711 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_f7bf8fb7-c5d8-41f4-9cfe-a5432e451c9d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_f7bf8fb7-c5d8-41f4-9cfe-a5432e451c9d_0_">
                      <gml:posList srsDimension="3">92860.0533612896 436824.79597604 19.725 92856.2852607998 436823.606244639 19.725 92856.2852607998 436823.606244639 16.7578125 92856.2852607998 436823.606244639 5.53000000000002 92860.0533612896 436824.79597604 5.53000000000002 92860.0533612895 436824.79597604 18.28125 92860.0533612896 436824.79597604 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_6f72899f-1b1e-451c-9199-39c412d75e5f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_6f72899f-1b1e-451c-9199-39c412d75e5f_0_">
                      <gml:posList srsDimension="3">92871.5879999995 436828.438000001 16.921875 92868.5700000003 436827.484999999 16.921875 92868.5700000003 436827.484999999 5.53000000000002 92871.5879999995 436828.438000001 5.53000000000002 92871.5879999995 436828.438000001 16.921875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_9ef8c477-cc96-42c8-8185-0ba9fbf6dda0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_9ef8c477-cc96-42c8-8185-0ba9fbf6dda0_0_">
                      <gml:posList srsDimension="3">92868.5700000003 436827.484999999 16.921875 92865.659542128 436826.566058711 16.921875 92865.659542128 436826.566058711 5.53000000000002 92868.5700000003 436827.484999999 5.53000000000002 92868.5700000003 436827.484999999 16.921875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_77aee94c-52e0-479d-afaf-15d064d818e0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_77aee94c-52e0-479d-afaf-15d064d818e0_0_">
                      <gml:posList srsDimension="3">92856.2852607998 436823.606244639 16.7578125 92853.32 436822.67 16.7578125 92853.3200000003 436822.670000002 5.53000000000002 92856.2852607998 436823.606244639 5.53000000000002 92856.2852607998 436823.606244639 16.7578125</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_e4bed554-48a7-463c-b300-2440c491f407">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_e4bed554-48a7-463c-b300-2440c491f407_0_">
                      <gml:posList srsDimension="3">92861.9830253599 436825.405243745 18.2812500000807 92860.0533612895 436824.79597604 18.28125 92860.0533612896 436824.79597604 5.53000000000002 92861.98302536 436825.405243745 5.53000000000002 92861.9830253599 436825.405243745 18.2812500000807</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_c7582428-360e-4e01-a1d7-aafc4b6e0ef3">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_3747ddc6-becf-4b35-9121-a7c7ec265f47">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_97585603-118b-4ee5-a225-b8ce15f98d9d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_97585603-118b-4ee5-a225-b8ce15f98d9d_0_">
                      <gml:posList srsDimension="3">92865.703355618 436837.524333959 19.725 92865.2902001903 436838.843388942 18.459375 92864.9899999983 436838.760000002 18.4569188823908 92865.703355618 436837.524333959 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_62c6703d-c08c-4288-891f-99d68db668f3">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_62c6703d-c08c-4288-891f-99d68db668f3_0_">
                      <gml:posList srsDimension="3">92864.9899999983 436838.760000002 18.4569188823908 92863.7788189674 436838.374520538 18.4470094847355 92864.2015316406 436837.046352316 19.725 92864.9899999983 436838.760000002 18.4569188823908</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_29908dc2-7a5b-45bb-a675-1889770b7734">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_29908dc2-7a5b-45bb-a675-1889770b7734_0_">
                      <gml:posList srsDimension="3">92865.703355618 436837.524333959 19.725 92864.9899999983 436838.760000002 18.4569188823908 92864.2015316406 436837.046352316 19.725 92865.703355618 436837.524333959 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:OuterCeilingSurface gml:id="UUID_f65a65d8-10f9-4e5f-b14d-fcfb7415e7be">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_462a701b-4732-48c6-b086-30cfd279492e">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_ef3684d0-1140-4c64-9bdd-849ddd15a0a0">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_ef3684d0-1140-4c64-9bdd-849ddd15a0a0_0_">
                      <gml:posList srsDimension="3">92871.5879999995 436828.438000001 5.53000000000002 92868.5700000003 436827.484999999 5.53000000000002 92865.659542128 436826.566058711 5.53000000000002 92861.98302536 436825.405243745 5.53000000000002 92860.0533612896 436824.79597604 5.53000000000002 92856.2852607998 436823.606244639 5.53000000000002 92853.3200000003 436822.670000002 5.53000000000002 92853.1999999993 436822.920000002 5.53000000000002 92853.25 436823.09 5.53000000000002 92853.0500000007 436823.73 5.53000000000002 92852.9268228635 436824.113092195 5.53000000000002 92850.1937038492 436832.613343075 5.53000000000002 92849.7800000012 436833.899999998 5.53000000000002 92851.0437165562 436834.304579688 5.53000000000002 92855.0899999999 436835.600000001 5.53000000000002 92856.6999999993 436830.600000001 5.53000000000002 92861.2699999995 436832.059999999 5.53000000000002 92859.6799999997 436837.07 5.53000000000002 92860.7747598239 436837.418426385 5.53000000000002 92863.7788189674 436838.374520538 5.53000000000002 92864.9899999983 436838.760000002 5.53000000000002 92865.2902001903 436838.843388942 5.53000000000002 92865.3500000015 436838.859999999 5.53000000000002 92867.9499999993 436839.690000001 5.53000000000002 92871.5879999995 436828.438000001 5.53000000000002</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:OuterCeilingSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_340279a2-0b2f-4482-a1e0-0dd7843cf6b4">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_7ea3eeb7-5648-40d4-b0f9-f0d28467e47c">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_1f4af2ea-38d6-4b38-9992-8331d9ff4714">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_1f4af2ea-38d6-4b38-9992-8331d9ff4714_0_">
                      <gml:posList srsDimension="3">92865.3500000015 436838.859999999 16.921875 92865.2902001903 436838.843388942 16.921875 92865.703355618 436837.524333959 16.921875 92868.3716127811 436829.006902513 16.921875 92865.2056048909 436828.015086695 16.921875 92865.659542128 436826.566058711 16.921875 92868.5700000003 436827.484999999 16.921875 92871.5879999995 436828.438000001 16.921875 92867.9499999993 436839.690000001 16.921875 92865.3500000015 436838.859999999 16.921875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_109dab68-2e05-4ee0-9120-704b857bf9b8">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_d6b4935b-565f-4dce-836e-f7abf7ef3ec9">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_a22c043a-6077-4110-8537-164f06d43c0b">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_a22c043a-6077-4110-8537-164f06d43c0b_0_">
                      <gml:posList srsDimension="3">92853.32 436822.67 16.7578125 92856.2852607998 436823.606244639 16.7578125 92855.8352845068 436825.031403199 16.7578125 92852.9268228635 436824.113092195 16.7578125 92853.05 436823.73 16.7578125 92853.25 436823.09 16.7578125 92853.2 436822.92 16.7578125 92853.32 436822.67 16.7578125</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_a28ea52e-b4cd-4be4-af0f-b8373a9d4c9e">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_736a103b-f581-4ceb-92a0-b6aaa3cd1bb7">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_2afd5dc1-69b7-443a-bcb4-2a7839cd4bdc">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_2afd5dc1-69b7-443a-bcb4-2a7839cd4bdc_0_">
                      <gml:posList srsDimension="3">92858.33 436838.107 17.896875 92858.072 436838.1 17.896875 92857.819 436838.048 17.896875 92857.578 436837.955 17.896875 92857.357 436837.822 17.896875 92857.162 436837.653 17.896875 92856.998 436837.454 17.896875 92856.87 436837.229 17.896875 92856.783 436836.987 17.896875 92856.738 436836.733 17.896875 92856.737 436836.474 17.896875 92856.78 436836.22 17.896875 92857.2382182768 436836.36194275 17.896875 92859.68 436837.07 17.896875 92859.579 436837.307 17.896875 92859.439 436837.524 17.896875 92859.264 436837.714 17.896875 92859.059 436837.871 17.896875 92858.831 436837.991 17.896875 92858.585 436838.071 17.896875 92858.33 436838.107 17.896875</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_5ddd6a89-2891-4f23-950b-de2d65f80f92">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_15e94ca6-cba4-49f3-b501-ca3bb4344b7d">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_8e7491b1-e490-4746-8bda-1064c5da296d">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_8e7491b1-e490-4746-8bda-1064c5da296d_0_">
                      <gml:posList srsDimension="3">92860.7747598239 436837.418426385 18.375 92859.68 436837.07 18.3769107806768 92857.2382182768 436836.36194275 18.3168555749799 92857.6732095132 436834.987096825 19.725 92861.1917896106 436836.100349939 19.725 92860.7747598239 436837.418426385 18.375</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_93ec0e31-0c54-4e45-9aad-527f919874a3">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_1e3b16dc-b728-4d9b-b9a1-3094578b20c5">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_0ecced3c-aa16-4f45-b9e7-f3ba59070d1f">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_0ecced3c-aa16-4f45-b9e7-f3ba59070d1f_0_">
                      <gml:posList srsDimension="3">92851.0437165562 436834.304579688 18.4983871952715 92849.7800000012 436833.899999998 18.496875 92850.1937038492 436832.613343075 19.725 92851.4569110101 436833.019507029 19.725 92851.0437165562 436834.304579688 18.4983871952715</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:RoofSurface gml:id="UUID_09973a1a-660d-4d1b-83c9-531f9ace7351">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_9ac6f43b-e74d-40e7-9055-e7942c9ad4fe">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_55163e44-8fa9-44aa-b966-5367e66a8894">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_55163e44-8fa9-44aa-b966-5367e66a8894_0_">
                      <gml:posList srsDimension="3">92865.703355618 436837.524333959 19.725 92864.2015316406 436837.046352316 19.725 92863.7788189674 436838.374520538 19.725 92860.7747598239 436837.418426385 19.725 92861.1917896106 436836.100349939 19.725 92857.6732095132 436834.987096825 19.725 92857.2382182768 436836.36194275 19.725 92856.78 436836.22 19.725 92855.0899999999 436835.600000001 19.725 92851.0437165562 436834.304579688 19.725 92851.4569110101 436833.019507029 19.725 92850.1937038492 436832.613343075 19.725 92852.9268228635 436824.113092195 19.725 92855.8352845068 436825.031403199 19.725 92856.2852607998 436823.606244639 19.725 92860.0533612896 436824.79597604 19.725 92859.6125844401 436826.191998253 19.725 92861.5422485104 436826.801265957 19.725 92861.98302536 436825.405243745 19.725 92865.659542128 436826.566058711 19.725 92865.2056048909 436828.015086695 19.725 92868.3716127811 436829.006902513 19.725 92865.703355618 436837.524333959 19.725</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:RoofSurface>
      </bldg:boundedBy>
      <bldg:boundedBy>
        <bldg:WallSurface gml:id="UUID_ece88dce-d5a1-4ffb-afbd-b14acd59a9c7">
          <creationDate>2019-06-11</creationDate>
          <bldg:lod2MultiSurface>
            <gml:MultiSurface gml:id="UUID_14c3f22a-b2e3-4d27-90c4-a7765bda675b">
              <gml:surfaceMember>
                <gml:Polygon gml:id="RCID_b9eca0a2-2e09-4569-80cb-4faa9ba9da0e">
                  <gml:exterior>
                    <gml:LinearRing gml:id="RCID_b9eca0a2-2e09-4569-80cb-4faa9ba9da0e_0_">
                      <gml:posList srsDimension="3">92861.2699999995 436832.059999999 2.57850000000051 92859.6799999997 436837.07 2.57850000000051 92859.6799999997 436837.07 5.53000000000002 92861.2699999995 436832.059999999 5.53000000000002 92861.2699999995 436832.059999999 2.57850000000051</gml:posList>
                    </gml:LinearRing>
                  </gml:exterior>
                </gml:Polygon>
              </gml:surfaceMember>
            </gml:MultiSurface>
          </bldg:lod2MultiSurface>
        </bldg:WallSurface>
      </bldg:boundedBy>
      <bldg:address>
        <Address>
          <xalAddress>
            <xAL:AddressDetails>
              <xAL:Country>
                <xAL:CountryName>Nederland</xAL:CountryName>
                <xAL:Locality Type="Town">
                  <xAL:LocalityName>Rotterdam</xAL:LocalityName>
                  <xAL:Thoroughfare Type="Street">
                    <xAL:ThoroughfareNumber>53-49</xAL:ThoroughfareNumber>
                    <xAL:ThoroughfareName>Wijnkade</xAL:ThoroughfareName>
                  </xAL:Thoroughfare>
                  <xAL:PostalCode>
                    <xAL:PostalCodeNumber>3011VZ</xAL:PostalCodeNumber>
                  </xAL:PostalCode>
                </xAL:Locality>
              </xAL:Country>
            </xAL:AddressDetails>
          </xalAddress>
          <multiPoint>
            <gml:MultiPoint>
              <gml:pointMember>
                <gml:Point>
                  <gml:pos srsDimension="3">92868.296 436835.662666667 2.59090000000045</gml:pos>
                </gml:Point>
              </gml:pointMember>
            </gml:MultiPoint>
          </multiPoint>
        </Address>
      </bldg:address>
    </bldg:Building>
  </cityObjectMember>
</CityModel>