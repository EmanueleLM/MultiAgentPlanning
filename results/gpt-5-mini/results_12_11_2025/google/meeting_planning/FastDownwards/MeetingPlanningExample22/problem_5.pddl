(define (problem meet-andrew-problem)
  (:domain meet-andrew)

  (:objects
    presidio union_square - location

    ;; Explicit time points used by the planned schedule instance (minutes from midnight as labels).
    ;; These time objects capture the allowed jumps: waits and travel, and the 105-minute meeting end.
    t540 t600 t630 t645 t653 t675 t780 - time
  )

  (:init
    ;; Start: at Presidio at 09:00 (540 minutes from midnight) and the current time marker
    (at presidio t540)
    (now t540)

    ;; Precomputed reach relations for the allowed jumps used by the feasible schedule:
    ;; Wait sequence at Presidio from 540 -> 600 (60), 600 -> 630 (30), 630 -> 645 (15), 645 -> 653 (8)
    (reach60 t540 t600)
    (reach30 t600 t630)
    (reach15 t630 t645)
    (reach8  t645 t653)

    ;; Travel Presidio -> Union Square: 22 minutes (653 -> 675)
    (reach22 t653 t675)

    ;; Meeting of 105 minutes: start at 675, finish at 780 (675 + 105 = 780).
    ;; Because reach105 pair is provided only for (675,780), the meeting can only be scheduled
    ;; starting at 675 and ending at 780 (which lies within Andrew's availability window).
    (reach105 t675 t780)
  )

  ;; Mandatory achievement: have met Andrew (meeting of at least 105 minutes within his window).
  (:goal (met-andrew))
)