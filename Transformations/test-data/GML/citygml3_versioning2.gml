<?xml version="1.0" encoding="UTF-8"?>
<core:CityModel xmlns="http://www.opengis.net/citygml/3.0"
    xmlns:bldg="http://www.opengis.net/citygml/building/3.0"
    xmlns:con="http://www.opengis.net/citygml/construction/3.0"
    xmlns:core="http://www.opengis.net/citygml/3.0"
    xmlns:vers="http://www.opengis.net/citygml/versioning/3.0"
    xmlns:xAL="urn:oasis:names:tc:ciq:xal:3"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.opengis.net/citygml/building/3.0 ../XMLSchema/CityGML3_2019-06-05/building.xsd
        http://www.opengis.net/citygml/construction/3.0 ../XMLSchema/CityGML3_2019-06-05/construction.xsd
        http://www.opengis.net/citygml/3.0 ../XMLSchema/CityGML3_2019-06-05/cityGMLBase.xsd
        http://www.opengis.net/citygml/versioning/3.0 ../XMLSchema/CityGML3_2019-06-05/versioning.xsd"
    gml:id="cm1">
    <core:versionMember>
        <vers:Version gml:id="version_1">
            <vers:tag>v1.0</vers:tag>
            <vers:versionMember xlink:href="#BU_69381AL49_v1"/>
        </vers:Version>
    </core:versionMember>
    <core:versionMember>
        <vers:Version gml:id="version_2">
            <vers:tag>v2.0</vers:tag>
            <vers:versionMember xlink:href="#BU_69381AL49_v2"/>
        </vers:Version>
    </core:versionMember>
    <core:versionTransitionMember>
        <vers:VersionTransition>
            <vers:reason>To exemplify a version transition</vers:reason>
            <vers:clonePredecessor>false</vers:clonePredecessor>
            <vers:from xlink:href="#version_1"/>
            <vers:to   xlink:href="#version_2"/>
            <vers:transaction>
                <vers:Transaction>
                    <vers:type>replace</vers:type>
                    <vers:oldFeature xlink:href="#BU_69381AL49_v1"/>
                    <vers:newFeature xlink:href="#BU_69381AL49_v2"/>
                </vers:Transaction>
            </vers:transaction>
        </vers:VersionTransition>
    </core:versionTransitionMember>
    <core:cityObjectMember>
        <bldg:BuildingPart gml:id="BU_69381AL49_v1_1">
            <core:creationDate>2000-01-01T00:00:00</core:creationDate>
            <core:boundary>
                <con:RoofSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_56029fb4-0431-4e89-9486-c1dc7f6ba3a4" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_53dfcc91-79ed-4dd0-a17d-62e788105a5a">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_67e50fbd-81d4-4bcd-887a-6ecc4073f14b">
                                            <gml:posList>1842423.12653602 5176403.95678450 251.48404126 1842422.54639425 5176405.33297213 252.08137190 1842411.45847816 5176400.62007696 253.33435847 1842411.58251212 5176400.14890391 253.14567728 1842411.92729415 5176398.59356639 252.53290408 1842411.87478097 5176396.13809660 251.64314924 1842423.12653602 5176403.95678450 251.48404126 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:RoofSurface>
            </core:boundary>
            <core:boundary>
                <con:RoofSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_9a87f697-8df8-4fb5-a6e1-35050907ccfb" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_0f4b2a31-bb91-4a95-99d3-de39818c2ce6">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_97d7ede6-e0d2-4e47-8e91-7603c17ba77b">
                                            <gml:posList>1842422.54639425 5176405.33297213 252.08137190 1842421.92622520 5176406.80411077 251.13404126 1842410.85150440 5176403.64696607 251.47854805 1842410.67491666 5176403.59662502 251.48404126 1842411.45847816 5176400.62007696 253.33435847 1842422.54639425 5176405.33297213 252.08137190 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:RoofSurface>
            </core:boundary>
            <core:boundary>
                <con:GroundSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_d8de8fc5-1dda-47c1-8631-10acb2cf616e" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_c58fc8da-4ee9-43c5-81ba-bb064bb52e9e">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_1988e9a0-80c5-11eb-9439-0242ac130002">
                                            <gml:posList>1842411.92729415 5176398.59356639 242.70000000 1842411.75490314 5176399.37123515 242.70000000 1842411.58251212 5176400.14890391 242.70000000 1842411.52049514 5176400.38449044 242.70000000 1842411.45847816 5176400.62007696 242.70000000 1842411.06669741 5176402.10835099 242.70000000 1842410.67491666 5176403.59662502 242.70000000 1842410.85150440 5176403.64696607 242.70000000 1842421.92622520 5176406.80411077 242.70000000 1842422.54639425 5176405.33297213 242.70000000 1842423.12653602 5176403.95678450 242.70000000 1842417.50065850 5176400.04744055 242.70000000 1842411.87478097 5176396.13809660 242.70000000 1842411.92729415 5176398.59356639 242.70000000 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:GroundSurface>
            </core:boundary>
            <core:boundary>
                <con:WallSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_3034e626-1ad2-4206-b1af-e405b5310db6" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_ad9f20b0-7f84-4c58-92a9-baf1943120fd">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_a96ac878-6562-40d4-af0d-7c8b99451aa4">
                                            <gml:posList>1842423.12653602 5176403.95678450 242.70000000 1842422.54639425 5176405.33297213 242.70000000 1842421.92622520 5176406.80411077 242.70000000 1842421.92622520 5176406.80411077 251.13404126 1842422.54639425 5176405.33297213 252.08137190 1842423.12653602 5176403.95678450 251.48404126 1842423.12653602 5176403.95678450 242.70000000 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:WallSurface>
            </core:boundary>
            <core:boundary>
                <con:WallSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_938d1233-8ec5-4bd2-9f76-f13f29864f72" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_3000219a-8d84-4597-add2-54763e3a114c">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_580a5659-0277-44d9-a646-56bb9d474942">
                                            <gml:posList>1842423.12653602 5176403.95678450 242.70000000 1842423.12653602 5176403.95678450 251.48404126 1842411.87478097 5176396.13809660 251.64314924 1842411.87478097 5176396.13809660 242.70000000 1842417.50065850 5176400.04744055 242.70000000 1842423.12653602 5176403.95678450 242.70000000 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:WallSurface>
            </core:boundary>
            <core:boundary>
                <con:WallSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_70762306-a0e0-4d21-830b-14870e520777" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_fd40093d-d200-4b61-aaa3-676ca000abb9">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_092ebaed-a1a7-497b-bc37-f1f9c8ce0229">
                                            <gml:posList>1842421.92622520 5176406.80411077 242.70000000 1842410.85150440 5176403.64696607 242.70000000 1842410.67491666 5176403.59662502 242.70000000 1842410.67491666 5176403.59662502 251.48404126 1842410.85150440 5176403.64696607 251.47854805 1842421.92622520 5176406.80411077 251.13404126 1842421.92622520 5176406.80411077 242.70000000 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:WallSurface>
            </core:boundary>
            <core:boundary>
                <con:WallSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_faa6c8b7-47f2-4a76-b8b9-938ef594269e" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_9b58ef62-3a07-458f-8273-3b9eef0ef288">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_db5a0eef-8b55-4bf4-b296-8c539cb25ade">
                                            <gml:posList>1842411.58251212 5176400.14890391 242.70000000 1842411.58251212 5176400.14890391 253.14567728 1842411.45847816 5176400.62007696 253.33435847 1842410.67491666 5176403.59662502 251.48404126 1842410.67491666 5176403.59662502 242.70000000 1842411.06669741 5176402.10835099 242.70000000 1842411.45847816 5176400.62007696 242.70000000 1842411.52049514 5176400.38449044 242.70000000 1842411.58251212 5176400.14890391 242.70000000 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:WallSurface>
            </core:boundary>
            <core:boundary>
                <con:WallSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_22cf7d5d-049c-4521-8893-c54b1350d009" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_9354cd24-06db-4520-8d62-8779d4a23184">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_e40e8d49-8745-4980-8f37-2571583d48de">
                                            <gml:posList>1842411.92729415 5176398.59356639 242.70000000 1842411.92729415 5176398.59356639 252.53290408 1842411.58251212 5176400.14890391 253.14567728 1842411.58251212 5176400.14890391 242.70000000 1842411.75490314 5176399.37123515 242.70000000 1842411.92729415 5176398.59356639 242.70000000 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:WallSurface>
            </core:boundary>
            <core:boundary>
                <con:WallSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_1988ec16-80c5-11eb-9439-0242ac130002" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_0ff9b86b-b049-450c-ba1f-43c036f56e6e">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_1988ed24-80c5-11eb-9439-0242ac130002">
                                            <gml:posList>1842411.92729415 5176398.59356639 242.70000000 1842411.87478097 5176396.13809660 242.70000000 1842411.87478097 5176396.13809660 251.64314924 1842411.92729415 5176398.59356639 252.53290408 1842411.92729415 5176398.59356639 242.70000000 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:WallSurface>
            </core:boundary>
            <core:lod2Solid>
                <gml:Solid gml:id="UUID_c9075a6f-7ea3-4763-8caa-7733ed0ef5c6">
                    <gml:exterior>
                        <gml:Shell gml:id="UUID_726489ae-35c0-41b3-a795-0f116695c4df">
                            <gml:surfaceMember xlink:href="#UUID_53dfcc91-79ed-4dd0-a17d-62e788105a5a"/>
                            <gml:surfaceMember xlink:href="#UUID_0f4b2a31-bb91-4a95-99d3-de39818c2ce6"/>
                            <gml:surfaceMember xlink:href="#UUID_3000219a-8d84-4597-add2-54763e3a114c"/>
                            <gml:surfaceMember xlink:href="#UUID_ad9f20b0-7f84-4c58-92a9-baf1943120fd"/>
                            <gml:surfaceMember xlink:href="#UUID_fd40093d-d200-4b61-aaa3-676ca000abb9"/>
                            <gml:surfaceMember xlink:href="#UUID_9b58ef62-3a07-458f-8273-3b9eef0ef288"/>
                            <gml:surfaceMember xlink:href="#UUID_9354cd24-06db-4520-8d62-8779d4a23184"/>
                            <gml:surfaceMember xlink:href="#UUID_0ff9b86b-b049-450c-ba1f-43c036f56e6e"/>
                            <gml:surfaceMember xlink:href="#UUID_c58fc8da-4ee9-43c5-81ba-bb064bb52e9e"/>
                        </gml:Shell>
                    </gml:exterior>
                </gml:Solid>
            </core:lod2Solid>
            <con:height>
                <con:Height>
                    <con:highReference>highestRoofEdge</con:highReference>
                    <con:lowReference>lowestGroundPoint</con:lowReference>
                    <con:status>measured</con:status>
                    <con:value uom="#m">10.63</con:value>
                </con:Height>
            </con:height>
        </bldg:BuildingPart>
    </core:cityObjectMember>
    <core:cityObjectMember>
        <bldg:BuildingPart gml:id="BU_69381AL49_v2_1">
            <core:creationDate>2015-01-01T00:00:00</core:creationDate>
            <core:boundary>
                <con:RoofSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_9f35b029-c0ab-4222-a718-ceb06f074d4f" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_fa062056-d387-4525-9541-8a7fb6380b85">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_459e036a-228f-456d-9b1d-feaf3dbb5de7">
                                            <gml:posList>1842411.92729415 5176398.59356639 251.94298580 1842411.58251212 5176400.14890391 251.94298580 1842408.24704050 5176398.86456561 251.94298580 1842408.10590869 5176398.81022217 251.94298580 1842409.73227069 5176394.85900992 251.94298580 1842411.87478097 5176396.13809660 251.94298580 1842411.92729415 5176398.59356639 251.94298580 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:RoofSurface>
            </core:boundary>
            <core:boundary>
                <con:WallSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_9f1ca801-7fd1-4e08-97b1-778776a93e04" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_372d7afb-4fe5-4fde-abe3-29fadf474e65">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_eb72285f-0145-421a-89fc-bd987fdc2481">
                                            <gml:posList>1842411.92729415 5176398.59356639 243.20000000 1842411.75490314 5176399.37123515 243.20000000 1842411.58251212 5176400.14890391 243.20000000 1842411.58251212 5176400.14890391 251.94298580 1842411.92729415 5176398.59356639 251.94298580 1842411.92729415 5176398.59356639 243.20000000 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:WallSurface>
            </core:boundary>
            <core:boundary>
                <con:WallSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_8bcd878e-c311-4db8-a3a9-e3771f729615" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_dfc5c02d-1716-4378-be66-e25f228b50a6">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_d62d309c-afd7-44f0-a59a-456391f9d96d">
                                            <gml:posList>1842411.58251212 5176400.14890391 243.20000000 1842408.24704050 5176398.86456561 243.20000000 1842408.10590869 5176398.81022217 243.20000000 1842408.10590869 5176398.81022217 251.94298580 1842408.24704050 5176398.86456561 251.94298580 1842411.58251212 5176400.14890391 251.94298580 1842411.58251212 5176400.14890391 243.20000000 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:WallSurface>
            </core:boundary>
            <core:boundary>
                <con:WallSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_d94d752a-2241-4c25-9f20-08f44f67aad0" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_c4936c24-0c93-4a6b-89a4-c3879a90fa40">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_5be74b05-31d8-4427-a0cc-fbcb52e06c52">
                                            <gml:posList>1842409.73227069 5176394.85900992 251.94298580 1842408.10590869 5176398.81022217 251.94298580 1842408.10590869 5176398.81022217 243.20000000 1842409.73227069 5176394.85900992 243.20000000 1842409.73227069 5176394.85900992 251.94298580 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:WallSurface>
            </core:boundary>
            <core:boundary>
                <con:WallSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_e1347c97-5db2-442c-a872-eeed45dfe38d" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_f8162c61-5b53-4c6d-9b48-0e84a5a4d937">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_368cd751-a6e6-45ed-89a6-357f50c0a4ff">
                                            <gml:posList>1842411.87478097 5176396.13809660 251.94298580 1842409.73227069 5176394.85900992 251.94298580 1842409.73227069 5176394.85900992 243.20000000 1842411.87478097 5176396.13809660 243.20000000 1842411.87478097 5176396.13809660 251.94298580 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:WallSurface>
            </core:boundary>
            <core:boundary>
                <con:WallSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_b70b5986-a4f7-4e71-a3d7-f422b2cbaf1b" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_3fc80ba6-8953-4cbd-9f5e-5d946329f2e7">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_f9f9bb45-5ba9-4dd9-bed4-6759a3566594">
                                            <gml:posList>1842411.92729415 5176398.59356639 251.94298580 1842411.87478097 5176396.13809660 251.94298580 1842411.87478097 5176396.13809660 243.20000000 1842411.92729415 5176398.59356639 243.20000000 1842411.92729415 5176398.59356639 251.94298580 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:WallSurface>
            </core:boundary>
            <core:boundary>
                <con:GroundSurface>
                    <core:lod2MultiSurface>
                        <gml:MultiSurface gml:id="UUID_e79f6ece-9aa1-4127-b521-15768fa6294b" srsDimension="3">
                            <gml:surfaceMember>
                                <gml:Polygon gml:id="UUID_be66a910-f380-45c5-8f56-07e6a08ea737">
                                    <gml:exterior>
                                        <gml:LinearRing gml:id="UUID_0f5ea52a-05f3-4596-a337-53f504eea9c0">
                                            <gml:posList>1842411.92729415 5176398.59356639 243.20000000 1842411.87478097 5176396.13809660 243.20000000 1842409.73227069 5176394.85900992 243.20000000 1842408.10590869 5176398.81022217 243.20000000 1842408.24704050 5176398.86456561 243.20000000 1842411.58251212 5176400.14890391 243.20000000 1842411.75490314 5176399.37123515 243.20000000 1842411.92729415 5176398.59356639 243.20000000 </gml:posList>
                                        </gml:LinearRing>
                                    </gml:exterior>
                                </gml:Polygon>
                            </gml:surfaceMember>
                        </gml:MultiSurface>
                    </core:lod2MultiSurface>
                </con:GroundSurface>
            </core:boundary>
            <core:lod2Solid>
                <gml:Solid gml:id="UUID_062c219f-3de4-4e4b-b040-62d0add7da40">
                    <gml:exterior>
                        <gml:Shell gml:id="UUID_27bd5ec3-d0eb-4ceb-99db-a5552a6db391">
                            <gml:surfaceMember xlink:href="#UUID_fa062056-d387-4525-9541-8a7fb6380b85"/>
                            <gml:surfaceMember xlink:href="#UUID_372d7afb-4fe5-4fde-abe3-29fadf474e65"/>
                            <gml:surfaceMember xlink:href="#UUID_dfc5c02d-1716-4378-be66-e25f228b50a6"/>
                            <gml:surfaceMember xlink:href="#UUID_c4936c24-0c93-4a6b-89a4-c3879a90fa40"/>
                            <gml:surfaceMember xlink:href="#UUID_f8162c61-5b53-4c6d-9b48-0e84a5a4d937"/>
                            <gml:surfaceMember xlink:href="#UUID_3fc80ba6-8953-4cbd-9f5e-5d946329f2e7"/>
                            <gml:surfaceMember xlink:href="#UUID_be66a910-f380-45c5-8f56-07e6a08ea737"/>
                        </gml:Shell>
                    </gml:exterior>
                </gml:Solid>
            </core:lod2Solid>
            <con:height>
                <con:Height>
                    <con:highReference>highestRoofEdge</con:highReference>
                    <con:lowReference>lowestGroundPoint</con:lowReference>
                    <con:status>measured</con:status>
                    <con:value uom="#m">8.743</con:value>
                </con:Height>
            </con:height>
        </bldg:BuildingPart>
    </core:cityObjectMember>
    <core:cityObjectMember>
        <bldg:Building gml:id="BU_69381AL49_v1">
            <gml:name>Building B v1</gml:name>
            <gml:boundedBy>
                <gml:Envelope srsDimension="3">
                    <gml:lowerCorner>1842408.000000 5176394.500000 243.199982</gml:lowerCorner>
                    <gml:upperCorner>1842412.000000 5176400.500000 251.943008</gml:upperCorner>
                </gml:Envelope>
            </gml:boundedBy>
            <bldg:buildingPart xlink:href="#BU_69381AL49_v1_1"/>
        </bldg:Building>
    </core:cityObjectMember>
    <core:cityObjectMember>
        <bldg:Building gml:id="BU_69381AL49_v2">
            <gml:name>Building B v2</gml:name>
            <gml:boundedBy>
                <gml:Envelope srsDimension="3">
                    <gml:lowerCorner>1842408.000000 5176394.500000 243.199982</gml:lowerCorner>
                    <gml:upperCorner>1842412.000000 5176400.500000 251.943008</gml:upperCorner>
                </gml:Envelope>
            </gml:boundedBy>
            <bldg:buildingPart xlink:href="#BU_69381AL49_v1_1"/>
            <bldg:buildingPart xlink:href="#BU_69381AL49_v2_1"/>
        </bldg:Building>
    </core:cityObjectMember>
</core:CityModel>
