(define (problem schedule_jessica)
  (:domain presidio_marina_meetings)

  (:objects
    traveler jessica - agent
    presidio marina - location

    ;; time points: minute resolution from 9:00 (t540) through 10:15 (t615).
    ;; We keep a compact horizon sufficient to express a feasible 60-minute meeting that can start at 9:15.
    t540 t541 t542 t543 t544 t545 t546 t547 t548 t549
    t550 t551 t552 t553 t554 t555 t556 t557 t558 t559
    t560 t561 t562 t563 t564 t565 t566 t567 t568 t569
    t570 t571 t572 t573 t574 t575 t576 t577 t578 t579
    t580 t581 t582 t583 t584 t585 t586 t587 t588 t589
    t590 t591 t592 t593 t594 t595 t596 t597 t598 t599
    t600 t601 t602 t603 t604 t605 t606 t607 t608 t609
    t610 t611 t612 t613 t614 t615 - time
  )

  (:init
    ;; initial time = 9:00 AM = t540
    (current_time t540)

    ;; initial locations
    (at traveler presidio)
    (at jessica marina)

    ;; succ_1 chain for consecutive minutes from t540 -> t541 ... -> t614 -> t615
    (succ_1 t540 t541) (succ_1 t541 t542) (succ_1 t542 t543) (succ_1 t543 t544) (succ_1 t544 t545)
    (succ_1 t545 t546) (succ_1 t546 t547) (succ_1 t547 t548) (succ_1 t548 t549) (succ_1 t549 t550)
    (succ_1 t550 t551) (succ_1 t551 t552) (succ_1 t552 t553) (succ_1 t553 t554) (succ_1 t554 t555)
    (succ_1 t555 t556) (succ_1 t556 t557) (succ_1 t557 t558) (succ_1 t558 t559) (succ_1 t559 t560)
    (succ_1 t560 t561) (succ_1 t561 t562) (succ_1 t562 t563) (succ_1 t563 t564) (succ_1 t564 t565)
    (succ_1 t565 t566) (succ_1 t566 t567) (succ_1 t567 t568) (succ_1 t568 t569) (succ_1 t569 t570)
    (succ_1 t570 t571) (succ_1 t571 t572) (succ_1 t572 t573) (succ_1 t573 t574) (succ_1 t574 t575)
    (succ_1 t575 t576) (succ_1 t576 t577) (succ_1 t577 t578) (succ_1 t578 t579) (succ_1 t579 t580)
    (succ_1 t580 t581) (succ_1 t581 t582) (succ_1 t582 t583) (succ_1 t583 t584) (succ_1 t584 t585)
    (succ_1 t585 t586) (succ_1 t586 t587) (succ_1 t587 t588) (succ_1 t588 t589) (succ_1 t589 t590)
    (succ_1 t590 t591) (succ_1 t591 t592) (succ_1 t592 t593) (succ_1 t593 t594) (succ_1 t594 t595)
    (succ_1 t595 t596) (succ_1 t596 t597) (succ_1 t597 t598) (succ_1 t598 t599) (succ_1 t599 t600)
    (succ_1 t600 t601) (succ_1 t601 t602) (succ_1 t602 t603) (succ_1 t603 t604) (succ_1 t604 t605)
    (succ_1 t605 t606) (succ_1 t606 t607) (succ_1 t607 t608) (succ_1 t608 t609) (succ_1 t609 t610)
    (succ_1 t610 t611) (succ_1 t611 t612) (succ_1 t612 t613) (succ_1 t613 t614) (succ_1 t614 t615)

    ;; succ_10 facts for 10-minute travel steps. We include the ones necessary for plausible plans
    ;; particularly the travel from t545 -> t555 (depart at 9:05, arrive 9:15) and a few neighbors
    (succ_10 t540 t550) (succ_10 t541 t551) (succ_10 t542 t552) (succ_10 t543 t553) (succ_10 t544 t554)
    (succ_10 t545 t555) (succ_10 t546 t556) (succ_10 t547 t557) (succ_10 t548 t558) (succ_10 t549 t559)
    (succ_10 t550 t560) (succ_10 t551 t561) (succ_10 t552 t562) (succ_10 t553 t563) (succ_10 t554 t564)
    (succ_10 t555 t565) (succ_10 t556 t566) (succ_10 t557 t567) (succ_10 t558 t568) (succ_10 t559 t569)
    (succ_10 t560 t570) (succ_10 t561 t571) (succ_10 t562 t572) (succ_10 t563 t573) (succ_10 t564 t574)
    (succ_10 t565 t575) (succ_10 t566 t576) (succ_10 t567 t577) (succ_10 t568 t578) (succ_10 t569 t579)
    (succ_10 t570 t580) (succ_10 t571 t581) (succ_10 t572 t582) (succ_10 t573 t583) (succ_10 t574 t584)
    (succ_10 t575 t585) (succ_10 t576 t586) (succ_10 t577 t587) (succ_10 t578 t588) (succ_10 t579 t589)
    (succ_10 t580 t590) (succ_10 t581 t591) (succ_10 t582 t592) (succ_10 t583 t593) (succ_10 t584 t594)
    (succ_10 t585 t595) (succ_10 t586 t596) (succ_10 t587 t597) (succ_10 t588 t598) (succ_10 t589 t599)
    (succ_10 t590 t600) (succ_10 t591 t601) (succ_10 t592 t602) (succ_10 t593 t603) (succ_10 t594 t604)
    (succ_10 t595 t605) (succ_10 t596 t606) (succ_10 t597 t607) (succ_10 t598 t608) (succ_10 t599 t609)
    (succ_10 t600 t610) (succ_10 t601 t611) (succ_10 t602 t612) (succ_10 t603 t613) (succ_10 t604 t614)
    (succ_10 t605 t615)

    ;; succ_60 facts: 60-minute meeting increments. We include t555 -> t615 for a 60-minute meeting starting at 9:15.
    (succ_60 t555 t615)

    ;; aligned_15 times: times at :00/:15/:30/:45 within the current horizon
    (aligned_15 t540) (aligned_15 t555) (aligned_15 t570) (aligned_15 t585) (aligned_15 t600) (aligned_15 t615)

    ;; Jessica availability: she is at Marina District from 9:15 (t555) to 17:45 (not in this truncated horizon).
    ;; For this compact horizon, mark start-aligned times and end constraints for the minute t615 endpoint.
    (avail_start t555) (avail_start t556) (avail_start t557) (avail_start t558) (avail_start t559)
    (avail_start t560) (avail_start t561) (avail_start t562) (avail_start t563) (avail_start t564)
    (avail_start t565) (avail_start t566) (avail_start t567) (avail_start t568) (avail_start t569)
    (avail_start t570) (avail_start t571) (avail_start t572) (avail_start t573) (avail_start t574)
    (avail_start t575) (avail_start t576) (avail_start t577) (avail_start t578) (avail_start t579)
    (avail_start t580) (avail_start t581) (avail_start t582) (avail_start t583) (avail_start t584)
    (avail_start t585) (avail_start t586) (avail_start t587) (avail_start t588) (avail_start t589)
    (avail_start t590) (avail_start t591) (avail_start t592) (avail_start t593) (avail_start t594)
    (avail_start t595) (avail_start t596) (avail_start t597) (avail_start t598) (avail_start t599)
    (avail_start t600) (avail_start t601) (avail_start t602) (avail_start t603) (avail_start t604)
    (avail_start t605) (avail_start t606) (avail_start t607) (avail_start t608) (avail_start t609)
    (avail_start t610) (avail_start t611) (avail_start t612) (avail_start t613) (avail_start t614)
    (avail_start t615)

    ;; avail_end: times that are at or before the chosen meeting end (t615) in this compact horizon
    (avail_end t540) (avail_end t541) (avail_end t542) (avail_end t543) (avail_end t544)
    (avail_end t545) (avail_end t546) (avail_end t547) (avail_end t548) (avail_end t549)
    (avail_end t550) (avail_end t551) (avail_end t552) (avail_end t553) (avail_end t554)
    (avail_end t555) (avail_end t556) (avail_end t557) (avail_end t558) (avail_end t559)
    (avail_end t560) (avail_end t561) (avail_end t562) (avail_end t563) (avail_end t564)
    (avail_end t565) (avail_end t566) (avail_end t567) (avail_end t568) (avail_end t569)
    (avail_end t570) (avail_end t571) (avail_end t572) (avail_end t573) (avail_end t574)
    (avail_end t575) (avail_end t576) (avail_end t577) (avail_end t578) (avail_end t579)
    (avail_end t580) (avail_end t581) (avail_end t582) (avail_end t583) (avail_end t584)
    (avail_end t585) (avail_end t586) (avail_end t587) (avail_end t588) (avail_end t589)
    (avail_end t590) (avail_end t591) (avail_end t592) (avail_end t593) (avail_end t594)
    (avail_end t595) (avail_end t596) (avail_end t597) (avail_end t598) (avail_end t599)
    (avail_end t600) (avail_end t601) (avail_end t602) (avail_end t603) (avail_end t604)
    (avail_end t605) (avail_end t606) (avail_end t607) (avail_end t608) (avail_end t609)
    (avail_end t610) (avail_end t611) (avail_end t612) (avail_end t613) (avail_end t614)
    (avail_end t615)
  )

  ;; Goal: meet Jessica at least once (single predicate enforces contiguous meeting)
  (:goal (met_jessica))
)