(define (problem meet-jessica-classical)
  (:domain sf-meet-classical)
  (:objects
    visitor jessica - agent
    haight sunset - location
    t0 t15 t30 t45 t60 t75 t90 t105 t120 t135 t150 t165 t180 t195 t210 t225 t240 t255 t270 t285 t300 t315 t330 t345 t360 t375 t390 t405 t420 t435 t450 t465 t480 t495 t510 t525 t540 t555 t570 t585 t600 t615 t630 t645 t660 t675 - time
  )

  (:init
    (current-time t0)
    (at-visitor haight)
    (jessica-at sunset)

    (after15 t0 t15) (after15 t15 t30) (after15 t30 t45) (after15 t45 t60)
    (after15 t60 t75) (after15 t75 t90) (after15 t90 t105) (after15 t105 t120)
    (after15 t120 t135) (after15 t135 t150) (after15 t150 t165) (after15 t165 t180)
    (after15 t180 t195) (after15 t195 t210) (after15 t210 t225) (after15 t225 t240)
    (after15 t240 t255) (after15 t255 t270) (after15 t270 t285) (after15 t285 t300)
    (after15 t300 t315) (after15 t315 t330) (after15 t330 t345) (after15 t345 t360)
    (after15 t360 t375) (after15 t375 t390) (after15 t390 t405) (after15 t405 t420)
    (after15 t420 t435) (after15 t435 t450) (after15 t450 t465) (after15 t465 t480)
    (after15 t480 t495) (after15 t495 t510) (after15 t510 t525) (after15 t525 t540)
    (after15 t540 t555) (after15 t555 t570) (after15 t570 t585) (after15 t585 t600)
    (after15 t600 t615) (after15 t615 t630) (after15 t630 t645) (after15 t645 t660)
    (after15 t660 t675)

    (jessica-available-interval t375 t465)
    (jessica-available-interval t390 t480)
    (jessica-available-interval t405 t495)
    (jessica-available-interval t420 t510)
    (jessica-available-interval t435 t525)
    (jessica-available-interval t450 t540)
    (jessica-available-interval t465 t555)
    (jessica-available-interval t480 t570)
    (jessica-available-interval t495 t585)
    (jessica-available-interval t510 t600)
    (jessica-available-interval t525 t615)
    (jessica-available-interval t540 t630)
    (jessica-available-interval t555 t645)
    (jessica-available-interval t570 t660)
    (jessica-available-interval t585 t675)

    (= (total-cost) 0)
  )

  (:goal (met))
  (:metric minimize (total-cost))
)