(define (problem meet-andrew-problem)
  (:domain meet-andrew)

  (:objects
    presidio union_square - location
    t540 t600 t630 t645 t653 t675 t780 - time
  )

  (:init
    ;; start at Presidio at 09:00 (540)
    (at presidio t540)
    (now t540)

    ;; allowed wait/transitions (explicit, discrete, and contiguous)
    (reach60 t540 t600)   ;; 540 -> 600 (+60)
    (reach30 t600 t630)   ;; 600 -> 630 (+30)
    (reach15 t630 t645)   ;; 630 -> 645 (+15)
    (reach8  t645 t653)   ;; 645 -> 653 (+8)

    ;; travel time Presidio -> Union Square is 22 minutes: 653 -> 675
    (reach22 t653 t675)

    ;; meeting duration 105 minutes: must start at 675 and end at 780 (within Andrew's window)
    ;; Andrew availability [675,1035], so the explicit allowed meet pair enforces start >=675 and end <=1035
    (reach105 t675 t780)
  )

  ;; goal: met Andrew for the required contiguous 105 minutes
  (:goal (met-andrew))
)