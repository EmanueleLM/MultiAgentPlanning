(define (problem meeting_planning_example19_problem)
  (:domain meeting_planning_example19)
  (:objects
    golden_gate_park pacific_heights - loc
    ;; minutes m0 = 09:00 through m705 = 20:45 (inclusive)
    m0 m1 m2 m3 m4 m5 m6 m7 m8 m9
    m10 m11 m12 m13 m14 m15 m16 m17 m18 m19
    m20 m21 m22 m23 m24 m25 m26 m27 m28 m29
    m30 m31 m32 m33 m34 m35 m36 m37 m38 m39
    m40 m41 m42 m43 m44 m45 m46 m47 m48 m49
    m50 m51 m52 m53 m54 m55 m56 m57 m58 m59
    m60 m61 m62 m63 m64 m65 m66 m67 m68 m69
    m70 m71 m72 m73 m74 m75 m76 m77 m78 m79
    m80 m81 m82 m83 m84 m85 m86 m87 m88 m89
    m90 m91 m92 m93 m94 m95 m96 m97 m98 m99
    m100 m101 m102 m103 m104 m105 m106 m107 m108 m109
    m110 m111 m112 m113 m114 m115 m116 m117 m118 m119
    m120 m121 m122 m123 m124 m125 m126 m127 m128 m129
    m130 m131 m132 m133 m134 m135 m136 m137 m138 m139
    m140 m141 m142 m143 m144 m145 m146 m147 m148 m149
    m150 m151 m152 m153 m154 m155 m156 m157 m158 m159
    m160 m161 m162 m163 m164 m165 m166 m167 m168 m169
    m170 m171 m172 m173 m174 m175 m176 m177 m178 m179
    m180 m181 m182 m183 m184 m185 m186 m187 m188 m189
    m190 m191 m192 m193 m194 m195 m196 m197 m198 m199
    m200 m201 m202 m203 m204 m205 m206 m207 m208 m209
    m210 m211 m212 m213 m214 m215 m216 m217 m218 m219
    m220 m221 m222 m223 m224 m225 m226 m227 m228 m229
    m230 m231 m232 m233 m234 m235 m236 m237 m238 m239
    m240 m241 m242 m243 m244 m245 m246 m247 m248 m249
    m250 m251 m252 m253 m254 m255 m256 m257 m258 m259
    m260 m261 m262 m263 m264 m265 m266 m267 m268 m269
    m270 m271 m272 m273 m274 m275 m276 m277 m278 m279
    m280 m281 m282 m283 m284 m285 m286 m287 m288 m289
    m290 m291 m292 m293 m294 m295 m296 m297 m298 m299
    m300 m301 m302 m303 m304 m305 m306 m307 m308 m309
    m310 m311 m312 m313 m314 m315 m316 m317 m318 m319
    m320 m321 m322 m323 m324 m325 m326 m327 m328 m329
    m330 m331 m332 m333 m334 m335 m336 m337 m338 m339
    m340 m341 m342 m343 m344 m345 m346 m347 m348 m349
    m350 m351 m352 m353 m354 m355 m356 m357 m358 m359
    m360 m361 m362 m363 m364 m365 m366 m367 m368 m369
    m370 m371 m372 m373 m374 m375 m376 m377 m378 m379
    m380 m381 m382 m383 m384 m385 m386 m387 m388 m389
    m390 m391 m392 m393 m394 m395 m396 m397 m398 m399
    m400 m401 m402 m403 m404 m405 m406 m407 m408 m409
    m410 m411 m412 m413 m414 m415 m416 m417 m418 m419
    m420 m421 m422 m423 m424 m425 m426 m427 m428 m429
    m430 m431 m432 m433 m434 m435 m436 m437 m438 m439
    m440 m441 m442 m443 m444 m445 m446 m447 m448 m449
    m450 m451 m452 m453 m454 m455 m456 m457 m458 m459
    m460 m461 m462 m463 m464 m465 m466 m467 m468 m469
    m470 m471 m472 m473 m474 m475 m476 m477 m478 m479
    m480 m481 m482 m483 m484 m485 m486 m487 m488 m489
    m490 m491 m492 m493 m494 m495 m496 m497 m498 m499
    m500 m501 m502 m503 m504 m505 m506 m507 m508 m509
    m510 m511 m512 m513 m514 m515 m516 m517 m518 m519
    m520 m521 m522 m523 m524 m525 m526 m527 m528 m529
    m530 m531 m532 m533 m534 m535 m536 m537 m538 m539
    m540 m541 m542 m543 m544 m545 m546 m547 m548 m549
    m550 m551 m552 m553 m554 m555 m556 m557 m558 m559
    m560 m561 m562 m563 m564 m565 m566 m567 m568 m569
    m570 m571 m572 m573 m574 m575 m576 m577 m578 m579
    m580 m581 m582 m583 m584 m585 m586 m587 m588 m589
    m590 m591 m592 m593 m594 m595 m596 m597 m598 m599
    m600 m601 m602 m603 m604 m605 m606 m607 m608 m609
    m610 m611 m612 m613 m614 m615 m616 m617 m618 m619
    m620 m621 m622 m623 m624 m625 m626 m627 m628 m629
    m630 m631 m632 m633 m634 m635 m636 m637 m638 m639
    m640 m641 m642 m643 m644 m645 m646 m647 m648 m649
    m650 m651 m652 m653 m654 m655 m656 m657 m658 m659
    m660 m661 m662 m663 m664 m665 m666 m667 m668 m669
    m670 m671 m672 m673 m674 m675 m676 m677 m678 m679
    m680 m681 m682 m683 m684 m685 m686 m687 m688 m689
    m690 m691 m692 m693 m694 m695 m696 m697 m698 m699
    m700 m701 m702 m703 m704 m705 - time
  )

  (:init
    ;; Successor relation between each consecutive minute (minute-by-minute timeline).
    ;; next m0 m1, next m1 m2, ..., next m704 m705
    ;; (I enumerate all adjacent minute pairs required by the domain; these are the minute-by-minute links.)
    ;; For brevity in human reading: all next facts from m0->m1 up to m704->m705 are included below.
    ;; (All are explicit facts; the solver will use them to verify minute chains.)
    ;; Below we list them explicitly:
    ;; [the full set required by the domain]
    ;; next chain:
    (next m0 m1) (next m1 m2) (next m2 m3) (next m3 m4) (next m4 m5) (next m5 m6) (next m6 m7) (next m7 m8) (next m8 m9) (next m9 m10)
    (next m10 m11) (next m11 m12) (next m12 m13) (next m13 m14) (next m14 m15) (next m15 m16) (next m16 m17) (next m17 m18) (next m18 m19) (next m19 m20)
    (next m20 m21) (next m21 m22) (next m22 m23) (next m23 m24) (next m24 m25) (next m25 m26) (next m26 m27) (next m27 m28) (next m28 m29) (next m29 m30)
    (next m30 m31) (next m31 m32) (next m32 m33) (next m33 m34) (next m34 m35) (next m35 m36) (next m36 m37) (next m37 m38) (next m38 m39) (next m39 m40)
    (next m40 m41) (next m41 m42) (next m42 m43) (next m43 m44) (next m44 m45) (next m45 m46) (next m46 m47) (next m47 m48) (next m48 m49) (next m49 m50)
    (next m50 m51) (next m51 m52) (next m52 m53) (next m53 m54) (next m54 m55) (next m55 m56) (next m56 m57) (next m57 m58) (next m58 m59) (next m59 m60)
    (next m60 m61) (next m61 m62) (next m62 m63) (next m63 m64) (next m64 m65) (next m65 m66) (next m66 m67) (next m67 m68) (next m68 m69) (next m69 m70)
    (next m70 m71) (next m71 m72) (next m72 m73) (next m73 m74) (next m74 m75) (next m75 m76) (next m76 m77) (next m77 m78) (next m78 m79) (next m79 m80)
    (next m80 m81) (next m81 m82) (next m82 m83) (next m83 m84) (next m84 m85) (next m85 m86) (next m86 m87) (next m87 m88) (next m88 m89) (next m89 m90)
    (next m90 m91) (next m91 m92) (next m92 m93) (next m93 m94) (next m94 m95) (next m95 m96) (next m96 m97) (next m97 m98) (next m98 m99) (next m99 m100)
    (next m100 m101) (next m101 m102) (next m102 m103) (next m103 m104) (next m104 m105) (next m105 m106) (next m106 m107) (next m107 m108) (next m108 m109) (next m109 m110)
    (next m110 m111) (next m111 m112) (next m112 m113) (next m113 m114) (next m114 m115) (next m115 m116) (next m116 m117) (next m117 m118) (next m118 m119) (next m119 m120)
    (next m120 m121) (next m121 m122) (next m122 m123) (next m123 m124) (next m124 m125) (next m125 m126) (next m126 m127) (next m127 m128) (next m128 m129) (next m129 m130)
    (next m130 m131) (next m131 m132) (next m132 m133) (next m133 m134) (next m134 m135) (next m135 m136) (next m136 m137) (next m137 m138) (next m138 m139) (next m139 m140)
    (next m140 m141) (next m141 m142) (next m142 m143) (next m143 m144) (next m144 m145) (next m145 m146) (next m146 m147) (next m147 m148) (next m148 m149) (next m149 m150)
    (next m150 m151) (next m151 m152) (next m152 m153) (next m153 m154) (next m154 m155) (next m155 m156) (next m156 m157) (next m157 m158) (next m158 m159) (next m159 m160)
    (next m160 m161) (next m161 m162) (next m162 m163) (next m163 m164) (next m164 m165) (next m165 m166) (next m166 m167) (next m167 m168) (next m168 m169) (next m169 m170)
    (next m170 m171) (next m171 m172) (next m172 m173) (next m173 m174) (next m174 m175) (next m175 m176) (next m176 m177) (next m177 m178) (next m178 m179) (next m179 m180)
    (next m180 m181) (next m181 m182) (next m182 m183) (next m183 m184) (next m184 m185) (next m185 m186) (next m186 m187) (next m187 m188) (next m188 m189) (next m189 m190)
    (next m190 m191) (next m191 m192) (next m192 m193) (next m193 m194) (next m194 m195) (next m195 m196) (next m196 m197) (next m197 m198) (next m198 m199) (next m199 m200)
    (next m200 m201) (next m201 m202) (next m202 m203) (next m203 m204) (next m204 m205) (next m205 m206) (next m206 m207) (next m207 m208) (next m208 m209) (next m209 m210)
    (next m210 m211) (next m211 m212) (next m212 m213) (next m213 m214) (next m214 m215) (next m215 m216) (next m216 m217) (next m217 m218) (next m218 m219) (next m219 m220)
    (next m220 m221) (next m221 m222) (next m222 m223) (next m223 m224) (next m224 m225) (next m225 m226) (next m226 m227) (next m227 m228) (next m228 m229) (next m229 m230)
    (next m230 m231) (next m231 m232) (next m232 m233) (next m233 m234) (next m234 m235) (next m235 m236) (next m236 m237) (next m237 m238) (next m238 m239) (next m239 m240)
    (next m240 m241) (next m241 m242) (next m242 m243) (next m243 m244) (next m244 m245) (next m245 m246) (next m246 m247) (next m247 m248) (next m248 m249) (next m249 m250)
    (next m250 m251) (next m251 m252) (next m252 m253) (next m253 m254) (next m254 m255) (next m255 m256) (next m256 m257) (next m257 m258) (next m258 m259) (next m259 m260)
    (next m260 m261) (next m261 m262) (next m262 m263) (next m263 m264) (next m264 m265) (next m265 m266) (next m266 m267) (next m267 m268) (next m268 m269) (next m269 m270)
    (next m270 m271) (next m271 m272) (next m272 m273) (next m273 m274) (next m274 m275) (next m275 m276) (next m276 m277) (next m277 m278) (next m278 m279) (next m279 m280)
    (next m280 m281) (next m281 m282) (next m282 m283) (next m283 m284) (next m284 m285) (next m285 m286) (next m286 m287) (next m287 m288) (next m288 m289) (next m289 m290)
    (next m290 m291) (next m291 m292) (next m292 m293) (next m293 m294) (next m294 m295) (next m295 m296) (next m296 m297) (next m297 m298) (next m298 m299) (next m299 m300)
    (next m300 m301) (next m301 m302) (next m302 m303) (next m303 m304) (next m304 m305) (next m305 m306) (next m306 m307) (next m307 m308) (next m308 m309) (next m309 m310)
    (next m310 m311) (next m311 m312) (next m312 m313) (next m313 m314) (next m314 m315) (next m315 m316) (next m316 m317) (next m317 m318) (next m318 m319) (next m319 m320)
    (next m320 m321) (next m321 m322) (next m322 m323) (next m323 m324) (next m324 m325) (next m325 m326) (next m326 m327) (next m327 m328) (next m328 m329) (next m329 m330)
    (next m330 m331) (next m331 m332) (next m332 m333) (next m333 m334) (next m334 m335) (next m335 m336) (next m336 m337) (next m337 m338) (next m338 m339) (next m339 m340)
    (next m340 m341) (next m341 m342) (next m342 m343) (next m343 m344) (next m344 m345) (next m345 m346) (next m346 m347) (next m347 m348) (next m348 m349) (next m349 m350)
    (next m350 m351) (next m351 m352) (next m352 m353) (next m353 m354) (next m354 m355) (next m355 m356) (next m356 m357) (next m357 m358) (next m358 m359) (next m359 m360)
    (next m360 m361) (next m361 m362) (next m362 m363) (next m363 m364) (next m364 m365) (next m365 m366) (next m366 m367) (next m367 m368) (next m368 m369) (next m369 m370)
    (next m370 m371) (next m371 m372) (next m372 m373) (next m373 m374) (next m374 m375) (next m375 m376) (next m376 m377) (next m377 m378) (next m378 m379) (next m379 m380)
    (next m380 m381) (next m381 m382) (next m382 m383) (next m383 m384) (next m384 m385) (next m385 m386) (next m386 m387) (next m387 m388) (next m388 m389) (next m389 m390)
    (next m390 m391) (next m391 m392) (next m392 m393) (next m393 m394) (next m394 m395) (next m395 m396) (next m396 m397) (next m397 m398) (next m398 m399) (next m399 m400)
    (next m400 m401) (next m401 m402) (next m402 m403) (next m403 m404) (next m404 m405) (next m405 m406) (next m406 m407) (next m407 m408) (next m408 m409) (next m409 m410)
    (next m410 m411) (next m411 m412) (next m412 m413) (next m413 m414) (next m414 m415) (next m415 m416) (next m416 m417) (next m417 m418) (next m418 m419) (next m419 m420)
    (next m420 m421) (next m421 m422) (next m422 m423) (next m423 m424) (next m424 m425) (next m425 m426) (next m426 m427) (next m427 m428) (next m428 m429) (next m429 m430)
    (next m430 m431) (next m431 m432) (next m432 m433) (next m433 m434) (next m434 m435) (next m435 m436) (next m436 m437) (next m437 m438) (next m438 m439) (next m439 m440)
    (next m440 m441) (next m441 m442) (next m442 m443) (next m443 m444) (next m444 m445) (next m445 m446) (next m446 m447) (next m447 m448) (next m448 m449) (next m449 m450)
    (next m450 m451) (next m451 m452) (next m452 m453) (next m453 m454) (next m454 m455) (next m455 m456) (next m456 m457) (next m457 m458) (next m458 m459) (next m459 m460)
    (next m460 m461) (next m461 m462) (next m462 m463) (next m463 m464) (next m464 m465) (next m465 m466) (next m466 m467) (next m467 m468) (next m468 m469) (next m469 m470)
    (next m470 m471) (next m471 m472) (next m472 m473) (next m473 m474) (next m474 m475) (next m475 m476) (next m476 m477) (next m477 m478) (next m478 m479) (next m479 m480)
    (next m480 m481) (next m481 m482) (next m482 m483) (next m483 m484) (next m484 m485) (next m485 m486) (next m486 m487) (next m487 m488) (next m488 m489) (next m489 m490)
    (next m490 m491) (next m491 m492) (next m492 m493) (next m493 m494) (next m494 m495) (next m495 m496) (next m496 m497) (next m497 m498) (next m498 m499) (next m499 m500)
    (next m500 m501) (next m501 m502) (next m502 m503) (next m503 m504) (next m504 m505) (next m505 m506) (next m506 m507) (next m507 m508) (next m508 m509) (next m509 m510)
    (next m510 m511) (next m511 m512) (next m512 m513) (next m513 m514) (next m514 m515) (next m515 m516) (next m516 m517) (next m517 m518) (next m518 m519) (next m519 m520)
    (next m520 m521) (next m521 m522) (next m522 m523) (next m523 m524) (next m524 m525) (next m525 m526) (next m526 m527) (next m527 m528) (next m528 m529) (next m529 m530)
    (next m530 m531) (next m531 m532) (next m532 m533) (next m533 m534) (next m534 m535) (next m535 m536) (next m536 m537) (next m537 m538) (next m538 m539) (next m539 m540)
    (next m540 m541) (next m541 m542) (next m542 m543) (next m543 m544) (next m544 m545) (next m545 m546) (next m546 m547) (next m547 m548) (next m548 m549) (next m549 m550)
    (next m550 m551) (next m551 m552) (next m552 m553) (next m553 m554) (next m554 m555) (next m555 m556) (next m556 m557) (next m557 m558) (next m558 m559) (next m559 m560)
    (next m560 m561) (next m561 m562) (next m562 m563) (next m563 m564) (next m564 m565) (next m565 m566) (next m566 m567) (next m567 m568) (next m568 m569) (next m569 m570)
    (next m570 m571) (next m571 m572) (next m572 m573) (next m573 m574) (next m574 m575) (next m575 m576) (next m576 m577) (next m577 m578) (next m578 m579) (next m579 m580)
    (next m580 m581) (next m581 m582) (next m582 m583) (next m583 m584) (next m584 m585) (next m585 m586) (next m586 m587) (next m587 m588) (next m588 m589) (next m589 m590)
    (next m590 m591) (next m591 m592) (next m592 m593) (next m593 m594) (next m594 m595) (next m595 m596) (next m596 m597) (next m597 m598) (next m598 m599) (next m599 m600)
    (next m600 m601) (next m601 m602) (next m602 m603) (next m603 m604) (next m604 m605) (next m605 m606) (next m606 m607) (next m607 m608) (next m608 m609) (next m609 m610)
    (next m610 m611) (next m611 m612) (next m612 m613) (next m613 m614) (next m614 m615) (next m615 m616) (next m616 m617) (next m617 m618) (next m618 m619) (next m619 m620)
    (next m620 m621) (next m621 m622) (next m622 m623) (next m623 m624) (next m624 m625) (next m625 m626) (next m626 m627) (next m627 m628) (next m628 m629) (next m629 m630)
    (next m630 m631) (next m631 m632) (next m632 m633) (next m633 m634) (next m634 m635) (next m635 m636) (next m636 m637) (next m637 m638) (next m638 m639) (next m639 m640)
    (next m640 m641) (next m641 m642) (next m642 m643) (next m643 m644) (next m644 m645) (next m645 m646) (next m646 m647) (next m647 m648) (next m648 m649) (next m649 m650)
    (next m650 m651) (next m651 m652) (next m652 m653) (next m653 m654) (next m654 m655) (next m655 m656) (next m656 m657) (next m657 m658) (next m658 m659) (next m659 m660)
    (next m660 m661) (next m661 m662) (next m662 m663) (next m663 m664) (next m664 m665) (next m665 m666) (next m666 m667) (next m667 m668) (next m668 m669) (next m669 m670)
    (next m670 m671) (next m671 m672) (next m672 m673) (next m673 m674) (next m674 m675) (next m675 m676) (next m676 m677) (next m677 m678) (next m678 m679) (next m679 m680)
    (next m680 m681) (next m681 m682) (next m682 m683) (next m683 m684) (next m684 m685) (next m685 m686) (next m686 m687) (next m687 m688) (next m688 m689) (next m689 m690)
    (next m690 m691) (next m691 m692) (next m692 m693) (next m693 m694) (next m694 m695) (next m695 m696) (next m696 m697) (next m697 m698) (next m698 m699) (next m699 m700)
    (next m700 m701) (next m701 m702) (next m702 m703) (next m703 m704) (next m704 m705)

    ;; Initial traveler presence at Golden Gate Park: we assert occupancy for each minute from m0 (09:00) up to and including m644 (19:44),
    ;; so the traveler can depart at minute m644 (19:44).
    (at_traveler golden_gate_park m0) (at_traveler golden_gate_park m1) (at_traveler golden_gate_park m2) (at_traveler golden_gate_park m3) (at_traveler golden_gate_park m4)
    (at_traveler golden_gate_park m5) (at_traveler golden_gate_park m6) (at_traveler golden_gate_park m7) (at_traveler golden_gate_park m8) (at_traveler golden_gate_park m9)
    (at_traveler golden_gate_park m10) (at_traveler golden_gate_park m11) (at_traveler golden_gate_park m12) (at_traveler golden_gate_park m13) (at_traveler golden_gate_park m14)
    (at_traveler golden_gate_park m15) (at_traveler golden_gate_park m16) (at_traveler golden_gate_park m17) (at_traveler golden_gate_park m18) (at_traveler golden_gate_park m19)
    (at_traveler golden_gate_park m20) (at_traveler golden_gate_park m21) (at_traveler golden_gate_park m22) (at_traveler golden_gate_park m23) (at_traveler golden_gate_park m24)
    (at_traveler golden_gate_park m25) (at_traveler golden_gate_park m26) (at_traveler golden_gate_park m27) (at_traveler golden_gate_park m28) (at_traveler golden_gate_park m29)
    (at_traveler golden_gate_park m30) (at_traveler golden_gate_park m31) (at_traveler golden_gate_park m32) (at_traveler golden_gate_park m33) (at_traveler golden_gate_park m34)
    (at_traveler golden_gate_park m35) (at_traveler golden_gate_park m36) (at_traveler golden_gate_park m37) (at_traveler golden_gate_park m38) (at_traveler golden_gate_park m39)
    (at_traveler golden_gate_park m40) (at_traveler golden_gate_park m41) (at_traveler golden_gate_park m42) (at_traveler golden_gate_park m43) (at_traveler golden_gate_park m44)
    (at_traveler golden_gate_park m45) (at_traveler golden_gate_park m46) (at_traveler golden_gate_park m47) (at_traveler golden_gate_park m48) (at_traveler golden_gate_park m49)
    (at_traveler golden_gate_park m50) (at_traveler golden_gate_park m51) (at_traveler golden_gate_park m52) (at_traveler golden_gate_park m53) (at_traveler golden_gate_park m54)
    (at_traveler golden_gate_park m55) (at_traveler golden_gate_park m56) (at_traveler golden_gate_park m57) (at_traveler golden_gate_park m58) (at_traveler golden_gate_park m59)
    (at_traveler golden_gate_park m60) (at_traveler golden_gate_park m61) (at_traveler golden_gate_park m62) (at_traveler golden_gate_park m63) (at_traveler golden_gate_park m64)
    (at_traveler golden_gate_park m65) (at_traveler golden_gate_park m66) (at_traveler golden_gate_park m67) (at_traveler golden_gate_park m68) (at_traveler golden_gate_park m69)
    (at_traveler golden_gate_park m70) (at_traveler golden_gate_park m71) (at_traveler golden_gate_park m72) (at_traveler golden_gate_park m73) (at_traveler golden_gate_park m74)
    (at_traveler golden_gate_park m75) (at_traveler golden_gate_park m76) (at_traveler golden_gate_park m77) (at_traveler golden_gate_park m78) (at_traveler golden_gate_park m79)
    (at_traveler golden_gate_park m80) (at_traveler golden_gate_park m81) (at_traveler golden_gate_park m82) (at_traveler golden_gate_park m83) (at_traveler golden_gate_park m84)
    (at_traveler golden_gate_park m85) (at_traveler golden_gate_park m86) (at_traveler golden_gate_park m87) (at_traveler golden_gate_park m88) (at_traveler golden_gate_park m89)
    (at_traveler golden_gate_park m90) (at_traveler golden_gate_park m91) (at_traveler golden_gate_park m92) (at_traveler golden_gate_park m93) (at_traveler golden_gate_park m94)
    (at_traveler golden_gate_park m95) (at_traveler golden_gate_park m96) (at_traveler golden_gate_park m97) (at_traveler golden_gate_park m98) (at_traveler golden_gate_park m99)
    (at_traveler golden_gate_park m100) (at_traveler golden_gate_park m101) (at_traveler golden_gate_park m102) (at_traveler golden_gate_park m103) (at_traveler golden_gate_park m104)
    (at_traveler golden_gate_park m105) (at_traveler golden_gate_park m106) (at_traveler golden_gate_park m107) (at_traveler golden_gate_park m108) (at_traveler golden_gate_park m109)
    (at_traveler golden_gate_park m110) (at_traveler golden_gate_park m111) (at_traveler golden_gate_park m112) (at_traveler golden_gate_park m113) (at_traveler golden_gate_park m114)
    (at_traveler golden_gate_park m115) (at_traveler golden_gate_park m116) (at_traveler golden_gate_park m117) (at_traveler golden_gate_park m118) (at_traveler golden_gate_park m119)
    (at_traveler golden_gate_park m120) (at_traveler golden_gate_park m121) (at_traveler golden_gate_park m122) (at_traveler golden_gate_park m123) (at_traveler golden_gate_park m124)
    (at_traveler golden_gate_park m125) (at_traveler golden_gate_park m126) (at_traveler golden_gate_park m127) (at_traveler golden_gate_park m128) (at_traveler golden_gate_park m129)
    (at_traveler golden_gate_park m130) (at_traveler golden_gate_park m131) (at_traveler golden_gate_park m132) (at_traveler golden_gate_park m133) (at_traveler golden_gate_park m134)
    (at_traveler golden_gate_park m135) (at_traveler golden_gate_park m136) (at_traveler golden_gate_park m137) (at_traveler golden_gate_park m138) (at_traveler golden_gate_park m139)
    (at_traveler golden_gate_park m140) (at_traveler golden_gate_park m141) (at_traveler golden_gate_park m142) (at_traveler golden_gate_park m143) (at_traveler golden_gate_park m144)
    (at_traveler golden_gate_park m145) (at_traveler golden_gate_park m146) (at_traveler golden_gate_park m147) (at_traveler golden_gate_park m148) (at_traveler golden_gate_park m149)
    (at_traveler golden_gate_park m150) (at_traveler golden_gate_park m151) (at_traveler golden_gate_park m152) (at_traveler golden_gate_park m153) (at_traveler golden_gate_park m154)
    (at_traveler golden_gate_park m155) (at_traveler golden_gate_park m156) (at_traveler golden_gate_park m157) (at_traveler golden_gate_park m158) (at_traveler golden_gate_park m159)
    (at_traveler golden_gate_park m160) (at_traveler golden_gate_park m161) (at_traveler golden_gate_park m162) (at_traveler golden_gate_park m163) (at_traveler golden_gate_park m164)
    (at_traveler golden_gate_park m165) (at_traveler golden_gate_park m166) (at_traveler golden_gate_park m167) (at_traveler golden_gate_park m168) (at_traveler golden_gate_park m169)
    (at_traveler golden_gate_park m170) (at_traveler golden_gate_park m171) (at_traveler golden_gate_park m172) (at_traveler golden_gate_park m173) (at_traveler golden_gate_park m174)
    (at_traveler golden_gate_park m175) (at_traveler golden_gate_park m176) (at_traveler golden_gate_park m177) (at_traveler golden_gate_park m178) (at_traveler golden_gate_park m179)
    (at_traveler golden_gate_park m180) (at_traveler golden_gate_park m181) (at_traveler golden_gate_park m182) (at_traveler golden_gate_park m183) (at_traveler golden_gate_park m184)
    (at_traveler golden_gate_park m185) (at_traveler golden_gate_park m186) (at_traveler golden_gate_park m187) (at_traveler golden_gate_park m188) (at_traveler golden_gate_park m189)
    (at_traveler golden_gate_park m190) (at_traveler golden_gate_park m191) (at_traveler golden_gate_park m192) (at_traveler golden_gate_park m193) (at_traveler golden_gate_park m194)
    (at_traveler golden_gate_park m195) (at_traveler golden_gate_park m196) (at_traveler golden_gate_park m197) (at_traveler golden_gate_park m198) (at_traveler golden_gate_park m199)
    (at_traveler golden_gate_park m200) (at_traveler golden_gate_park m201) (at_traveler golden_gate_park m202) (at_traveler golden_gate_park m203) (at_traveler golden_gate_park m204)
    (at_traveler golden_gate_park m205) (at_traveler golden_gate_park m206) (at_traveler golden_gate_park m207) (at_traveler golden_gate_park m208) (at_traveler golden_gate_park m209)
    (at_traveler golden_gate_park m210) (at_traveler golden_gate_park m211) (at_traveler golden_gate_park m212) (at_traveler golden_gate_park m213) (at_traveler golden_gate_park m214)
    (at_traveler golden_gate_park m215) (at_traveler golden_gate_park m216) (at_traveler golden_gate_park m217) (at_traveler golden_gate_park m218) (at_traveler golden_gate_park m219)
    (at_traveler golden_gate_park m220) (at_traveler golden_gate_park m221) (at_traveler golden_gate_park m222) (at_traveler golden_gate_park m223) (at_traveler golden_gate_park m224)
    (at_traveler golden_gate_park m225) (at_traveler golden_gate_park m226) (at_traveler golden_gate_park m227) (at_traveler golden_gate_park m228) (at_traveler golden_gate_park m229)
    (at_traveler golden_gate_park m230) (at_traveler golden_gate_park m231) (at_traveler golden_gate_park m232) (at_traveler golden_gate_park m233) (at_traveler golden_gate_park m234)
    (at_traveler golden_gate_park m235) (at_traveler golden_gate_park m236) (at_traveler golden_gate_park m237) (at_traveler golden_gate_park m238) (at_traveler golden_gate_park m239)
    (at_traveler golden_gate_park m240) (at_traveler golden_gate_park m241) (at_traveler golden_gate_park m242) (at_traveler golden_gate_park m243) (at_traveler golden_gate_park m244)
    (at_traveler golden_gate_park m245) (at_traveler golden_gate_park m246) (at_traveler golden_gate_park m247) (at_traveler golden_gate_park m248) (at_traveler golden_gate_park m249)
    (at_traveler golden_gate_park m250) (at_traveler golden_gate_park m251) (at_traveler golden_gate_park m252) (at_traveler golden_gate_park m253) (at_traveler golden_gate_park m254)
    (at_traveler golden_gate_park m255) (at_traveler golden_gate_park m256) (at_traveler golden_gate_park m257) (at_traveler golden_gate_park m258) (at_traveler golden_gate_park m259)
    (at_traveler golden_gate_park m260) (at_traveler golden_gate_park m261) (at_traveler golden_gate_park m262) (at_traveler golden_gate_park m263) (at_traveler golden_gate_park m264)
    (at_traveler golden_gate_park m265) (at_traveler golden_gate_park m266) (at_traveler golden_gate_park m267) (at_traveler golden_gate_park m268) (at_traveler golden_gate_park m269)
    (at_traveler golden_gate_park m270) (at_traveler golden_gate_park m271) (at_traveler golden_gate_park m272) (at_traveler golden_gate_park m273) (at_traveler golden_gate_park m274)
    (at_traveler golden_gate_park m275) (at_traveler golden_gate_park m276) (at_traveler golden_gate_park m277) (at_traveler golden_gate_park m278) (at_traveler golden_gate_park m279)
    (at_traveler golden_gate_park m280) (at_traveler golden_gate_park m281) (at_traveler golden_gate_park m282) (at_traveler golden_gate_park m283) (at_traveler golden_gate_park m284)
    (at_traveler golden_gate_park m285) (at_traveler golden_gate_park m286) (at_traveler golden_gate_park m287) (at_traveler golden_gate_park m288) (at_traveler golden_gate_park m289)
    (at_traveler golden_gate_park m290) (at_traveler golden_gate_park m291) (at_traveler golden_gate_park m292) (at_traveler golden_gate_park m293) (at_traveler golden_gate_park m294)
    (at_traveler golden_gate_park m295) (at_traveler golden_gate_park m296) (at_traveler golden_gate_park m297) (at_traveler golden_gate_park m298) (at_traveler golden_gate_park m299)
    (at_traveler golden_gate_park m300) (at_traveler golden_gate_park m301) (at_traveler golden_gate_park m302) (at_traveler golden_gate_park m303) (at_traveler golden_gate_park m304)
    (at_traveler golden_gate_park m305) (at_traveler golden_gate_park m306) (at_traveler golden_gate_park m307) (at_traveler golden_gate_park m308) (at_traveler golden_gate_park m309)
    (at_traveler golden_gate_park m310) (at_traveler golden_gate_park m311) (at_traveler golden_gate_park m312) (at_traveler golden_gate_park m313) (at_traveler golden_gate_park m314)
    (at_traveler golden_gate_park m315) (at_traveler golden_gate_park m316) (at_traveler golden_gate_park m317) (at_traveler golden_gate_park m318) (at_traveler golden_gate_park m319)
    (at_traveler golden_gate_park m320) (at_traveler golden_gate_park m321) (at_traveler golden_gate_park m322) (at_traveler golden_gate_park m323) (at_traveler golden_gate_park m324)
    (at_traveler golden_gate_park m325) (at_traveler golden_gate_park m326) (at_traveler golden_gate_park m327) (at_traveler golden_gate_park m328) (at_traveler golden_gate_park m329)
    (at_traveler golden_gate_park m330) (at_traveler golden_gate_park m331) (at_traveler golden_gate_park m332) (at_traveler golden_gate_park m333) (at_traveler golden_gate_park m334)
    (at_traveler golden_gate_park m335) (at_traveler golden_gate_park m336) (at_traveler golden_gate_park m337) (at_traveler golden_gate_park m338) (at_traveler golden_gate_park m339)
    (at_traveler golden_gate_park m340) (at_traveler golden_gate_park m341) (at_traveler golden_gate_park m342) (at_traveler golden_gate_park m343) (at_traveler golden_gate_park m344)
    (at_traveler golden_gate_park m345) (at_traveler golden_gate_park m346) (at_traveler golden_gate_park m347) (at_traveler golden_gate_park m348) (at_traveler golden_gate_park m349)
    (at_traveler golden_gate_park m350) (at_traveler golden_gate_park m351) (at_traveler golden_gate_park m352) (at_traveler golden_gate_park m353) (at_traveler golden_gate_park m354)
    (at_traveler golden_gate_park m355) (at_traveler golden_gate_park m356) (at_traveler golden_gate_park m357) (at_traveler golden_gate_park m358) (at_traveler golden_gate_park m359)
    (at_traveler golden_gate_park m360) (at_traveler golden_gate_park m361) (at_traveler golden_gate_park m362) (at_traveler golden_gate_park m363) (at_traveler golden_gate_park m364)
    (at_traveler golden_gate_park m365) (at_traveler golden_gate_park m366) (at_traveler golden_gate_park m367) (at_traveler golden_gate_park m368) (at_traveler golden_gate_park m369)
    (at_traveler golden_gate_park m370) (at_traveler golden_gate_park m371) (at_traveler golden_gate_park m372) (at_traveler golden_gate_park m373) (at_traveler golden_gate_park m374)
    (at_traveler golden_gate_park m375) (at_traveler golden_gate_park m376) (at_traveler golden_gate_park m377) (at_traveler golden_gate_park m378) (at_traveler golden_gate_park m379)
    (at_traveler golden_gate_park m380) (at_traveler golden_gate_park m381) (at_traveler golden_gate_park m382) (at_traveler golden_gate_park m383) (at_traveler golden_gate_park m384)
    (at_traveler golden_gate_park m385) (at_traveler golden_gate_park m386) (at_traveler golden_gate_park m387) (at_traveler golden_gate_park m388) (at_traveler golden_gate_park m389)
    (at_traveler golden_gate_park m390) (at_traveler golden_gate_park m391) (at_traveler golden_gate_park m392) (at_traveler golden_gate_park m393) (at_traveler golden_gate_park m394)
    (at_traveler golden_gate_park m395) (at_traveler golden_gate_park m396) (at_traveler golden_gate_park m397) (at_traveler golden_gate_park m398) (at_traveler golden_gate_park m399)
    (at_traveler golden_gate_park m400) (at_traveler golden_gate_park m401) (at_traveler golden_gate_park m402) (at_traveler golden_gate_park m403) (at_traveler golden_gate_park m404)
    (at_traveler golden_gate_park m405) (at_traveler golden_gate_park m406) (at_traveler golden_gate_park m407) (at_traveler golden_gate_park m408) (at_traveler golden_gate_park m409)
    (at_traveler golden_gate_park m410) (at_traveler golden_gate_park m411) (at_traveler golden_gate_park m412) (at_traveler golden_gate_park m413) (at_traveler golden_gate_park m414)
    (at_traveler golden_gate_park m415) (at_traveler golden_gate_park m416) (at_traveler golden_gate_park m417) (at_traveler golden_gate_park m418) (at_traveler golden_gate_park m419)
    (at_traveler golden_gate_park m420) (at_traveler golden_gate_park m421) (at_traveler golden_gate_park m422) (at_traveler golden_gate_park m423) (at_traveler golden_gate_park m424)
    (at_traveler golden_gate_park m425) (at_traveler golden_gate_park m426) (at_traveler golden_gate_park m427) (at_traveler golden_gate_park m428) (at_traveler golden_gate_park m429)
    (at_traveler golden_gate_park m430) (at_traveler golden_gate_park m431) (at_traveler golden_gate_park m432) (at_traveler golden_gate_park m433) (at_traveler golden_gate_park m434)
    (at_traveler golden_gate_park m435) (at_traveler golden_gate_park m436) (at_traveler golden_gate_park m437) (at_traveler golden_gate_park m438) (at_traveler golden_gate_park m439)
    (at_traveler golden_gate_park m440) (at_traveler golden_gate_park m441) (at_traveler golden_gate_park m442) (at_traveler golden_gate_park m443) (at_traveler golden_gate_park m444)
    (at_traveler golden_gate_park m445) (at_traveler golden_gate_park m446) (at_traveler golden_gate_park m447) (at_traveler golden_gate_park m448) (at_traveler golden_gate_park m449)
    (at_traveler golden_gate_park m450) (at_traveler golden_gate_park m451) (at_traveler golden_gate_park m452) (at_traveler golden_gate_park m453) (at_traveler golden_gate_park m454)
    (at_traveler golden_gate_park m455) (at_traveler golden_gate_park m456) (at_traveler golden_gate_park m457) (at_traveler golden_gate_park m458) (at_traveler golden_gate_park m459)
    (at_traveler golden_gate_park m460) (at_traveler golden_gate_park m461) (at_traveler golden_gate_park m462) (at_traveler golden_gate_park m463) (at_traveler golden_gate_park m464)
    (at_traveler golden_gate_park m465) (at_traveler golden_gate_park m466) (at_traveler golden_gate_park m467) (at_traveler golden_gate_park m468) (at_traveler golden_gate_park m469)
    (at_traveler golden_gate_park m470) (at_traveler golden_gate_park m471) (at_traveler golden_gate_park m472) (at_traveler golden_gate_park m473) (at_traveler golden_gate_park m474)
    (at_traveler golden_gate_park m475) (at_traveler golden_gate_park m476) (at_traveler golden_gate_park m477) (at_traveler golden_gate_park m478) (at_traveler golden_gate_park m479)
    (at_traveler golden_gate_park m480) (at_traveler golden_gate_park m481) (at_traveler golden_gate_park m482) (at_traveler golden_gate_park m483) (at_traveler golden_gate_park m484)
    (at_traveler golden_gate_park m485) (at_traveler golden_gate_park m486) (at_traveler golden_gate_park m487) (at_traveler golden_gate_park m488) (at_traveler golden_gate_park m489)
    (at_traveler golden_gate_park m490) (at_traveler golden_gate_park m491) (at_traveler golden_gate_park m492) (at_traveler golden_gate_park m493) (at_traveler golden_gate_park m494)
    (at_traveler golden_gate_park m495) (at_traveler golden_gate_park m496) (at_traveler golden_gate_park m497) (at_traveler golden_gate_park m498) (at_traveler golden_gate_park m499)
    (at_traveler golden_gate_park m500) (at_traveler golden_gate_park m501) (at_traveler golden_gate_park m502) (at_traveler golden_gate_park m503) (at_traveler golden_gate_park m504)
    (at_traveler golden_gate_park m505) (at_traveler golden_gate_park m506) (at_traveler golden_gate_park m507) (at_traveler golden_gate_park m508) (at_traveler golden_gate_park m509)
    (at_traveler golden_gate_park m510) (at_traveler golden_gate_park m511) (at_traveler golden_gate_park m512) (at_traveler golden_gate_park m513) (at_traveler golden_gate_park m514)
    (at_traveler golden_gate_park m515) (at_traveler golden_gate_park m516) (at_traveler golden_gate_park m517) (at_traveler golden_gate_park m518) (at_traveler golden_gate_park m519)
    (at_traveler golden_gate_park m520) (at_traveler golden_gate_park m521) (at_traveler golden_gate_park m522) (at_traveler golden_gate_park m523) (at_traveler golden_gate_park m524)
    (at_traveler golden_gate_park m525) (at_traveler golden_gate_park m526) (at_traveler golden_gate_park m527) (at_traveler golden_gate_park m528) (at_traveler golden_gate_park m529)
    (at_traveler golden_gate_park m530) (at_traveler golden_gate_park m531) (at_traveler golden_gate_park m532) (at_traveler golden_gate_park m533) (at_traveler golden_gate_park m534)
    (at_traveler golden_gate_park m535) (at_traveler golden_gate_park m536) (at_traveler golden_gate_park m537) (at_traveler golden_gate_park m538) (at_traveler golden_gate_park m539)
    (at_traveler golden_gate_park m540) (at_traveler golden_gate_park m541) (at_traveler golden_gate_park m542) (at_traveler golden_gate_park m543) (at_traveler golden_gate_park m544)
    (at_traveler golden_gate_park m545) (at_traveler golden_gate_park m546) (at_traveler golden_gate_park m547) (at_traveler golden_gate_park m548) (at_traveler golden_gate_park m549)
    (at_traveler golden_gate_park m550) (at_traveler golden_gate_park m551) (at_traveler golden_gate_park m552) (at_traveler golden_gate_park m553) (at_traveler golden_gate_park m554)
    (at_traveler golden_gate_park m555) (at_traveler golden_gate_park m556) (at_traveler golden_gate_park m557) (at_traveler golden_gate_park m558) (at_traveler golden_gate_park m559)
    (at_traveler golden_gate_park m560) (at_traveler golden_gate_park m561) (at_traveler golden_gate_park m562) (at_traveler golden_gate_park m563) (at_traveler golden_gate_park m564)
    (at_traveler golden_gate_park m565) (at_traveler golden_gate_park m566) (at_traveler golden_gate_park m567) (at_traveler golden_gate_park m568) (at_traveler golden_gate_park m569)
    (at_traveler golden_gate_park m570) (at_traveler golden_gate_park m571) (at_traveler golden_gate_park m572) (at_traveler golden_gate_park m573) (at_traveler golden_gate_park m574)
    (at_traveler golden_gate_park m575) (at_traveler golden_gate_park m576) (at_traveler golden_gate_park m577) (at_traveler golden_gate_park m578) (at_traveler golden_gate_park m579)
    (at_traveler golden_gate_park m580) (at_traveler golden_gate_park m581) (at_traveler golden_gate_park m582) (at_traveler golden_gate_park m583) (at_traveler golden_gate_park m584)
    (at_traveler golden_gate_park m585) (at_traveler golden_gate_park m586) (at_traveler golden_gate_park m587) (at_traveler golden_gate_park m588) (at_traveler golden_gate_park m589)
    (at_traveler golden_gate_park m590) (at_traveler golden_gate_park m591) (at_traveler golden_gate_park m592) (at_traveler golden_gate_park m593) (at_traveler golden_gate_park m594)
    (at_traveler golden_gate_park m595) (at_traveler golden_gate_park m596) (at_traveler golden_gate_park m597) (at_traveler golden_gate_park m598) (at_traveler golden_gate_park m599)
    (at_traveler golden_gate_park m600) (at_traveler golden_gate_park m601) (at_traveler golden_gate_park m602) (at_traveler golden_gate_park m603) (at_traveler golden_gate_park m604)
    (at_traveler golden_gate_park m605) (at_traveler golden_gate_park m606) (at_traveler golden_gate_park m607) (at_traveler golden_gate_park m608) (at_traveler golden_gate_park m609)
    (at_traveler golden_gate_park m610) (at_traveler golden_gate_park m611) (at_traveler golden_gate_park m612) (at_traveler golden_gate_park m613) (at_traveler golden_gate_park m614)
    (at_traveler golden_gate_park m615) (at_traveler golden_gate_park m616) (at_traveler golden_gate_park m617) (at_traveler golden_gate_park m618) (at_traveler golden_gate_park m619)
    (at_traveler golden_gate_park m620) (at_traveler golden_gate_park m621) (at_traveler golden_gate_park m622) (at_traveler golden_gate_park m623) (at_traveler golden_gate_park m624)
    (at_traveler golden_gate_park m625) (at_traveler golden_gate_park m626) (at_traveler golden_gate_park m627) (at_traveler golden_gate_park m628) (at_traveler golden_gate_park m629)
    (at_traveler golden_gate_park m630) (at_traveler golden_gate_park m631) (at_traveler golden_gate_park m632) (at_traveler golden_gate_park m633) (at_traveler golden_gate_park m634)
    (at_traveler golden_gate_park m635) (at_traveler golden_gate_park m636) (at_traveler golden_gate_park m637) (at_traveler golden_gate_park m638) (at_traveler golden_gate_park m639)
    (at_traveler golden_gate_park m640) (at_traveler golden_gate_park m641) (at_traveler golden_gate_park m642) (at_traveler golden_gate_park m643) (at_traveler golden_gate_park m644)

    ;; John's availability: John is at Pacific Heights from 19:45 to 20:45.
    ;; Map: m645 = 19:45 through m704 = 20:44 inclusive. We assert john_at pacific_heights for each minute m645..m704.
    (john_at pacific_heights m645) (john_at pacific_heights m646) (john_at pacific_heights m647) (john_at pacific_heights m648) (john_at pacific_heights m649)
    (john_at pacific_heights m650) (john_at pacific_heights m651) (john_at pacific_heights m652) (john_at pacific_heights m653) (john_at pacific_heights m654)
    (john_at pacific_heights m655) (john_at pacific_heights m656) (john_at pacific_heights m657) (john_at pacific_heights m658) (john_at pacific_heights m659)
    (john_at pacific_heights m660) (john_at pacific_heights m661) (john_at pacific_heights m662) (john_at pacific_heights m663) (john_at pacific_heights m664)
    (john_at pacific_heights m665) (john_at pacific_heights m666) (john_at pacific_heights m667) (john_at pacific_heights m668) (john_at pacific_heights m669)
    (john_at pacific_heights m670) (john_at pacific_heights m671) (john_at pacific_heights m672) (john_at pacific_heights m673) (john_at pacific_heights m674)
    (john_at pacific_heights m675) (john_at pacific_heights m676) (john_at pacific_heights m677) (john_at pacific_heights m678) (john_at pacific_heights m679)
    (john_at pacific_heights m680) (john_at pacific_heights m681) (john_at pacific_heights m682) (john_at pacific_heights m683) (john_at pacific_heights m684)
    (john_at pacific_heights m685) (john_at pacific_heights m686) (john_at pacific_heights m687) (john_at pacific_heights m688) (john_at pacific_heights m689)
    (john_at pacific_heights m690) (john_at pacific_heights m691) (john_at pacific_heights m692) (john_at pacific_heights m693) (john_at pacific_heights m694)
    (john_at pacific_heights m695) (john_at pacific_heights m696) (john_at pacific_heights m697) (john_at pacific_heights m698) (john_at pacific_heights m699)
    (john_at pacific_heights m700) (john_at pacific_heights m701) (john_at pacific_heights m702) (john_at pacific_heights m703) (john_at pacific_heights m704)
  )

  ;; Goal: have met John for 45 continuous minutes (met_john_45 predicate).
  (:goal (met_john_45))
)