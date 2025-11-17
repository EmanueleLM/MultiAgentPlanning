(define (problem schedule-option-2)
  (:domain meeting-scheduling)

  (:objects
    orchestrator - agent
    Margaret - friend
    Marina_District Pacific_Heights - location
    t0 t580 t587 t600 t630 t636 t690 - time
  )

  (:init
    ; initial agent location and time
    (at orchestrator Marina_District t0)

    ; friend static location
    (friend-at Margaret Pacific_Heights)

    ; explicitly defined permitted segments (enforces contiguity & directed travel durations)
    ; Wait at Marina from 0 -> 580 (agent waits until starting travel)
    (wait-seg Marina_District t0 t580)

    ; Travel Marina -> Pacific Heights from 580 -> 587 (7 minutes)
    (travel-seg Marina_District Pacific_Heights t580 t587)

    ; Wait at Pacific Heights from 587 -> 600 (pre-meeting slack 13 minutes)
    (wait-seg Pacific_Heights t587 t600)

    ; Meeting segment for Margaret from 600 -> 630 (30-minute meeting, within availability 600-645)
    (meet-seg Margaret t600 t630)

    ; Travel Pacific Heights -> Marina from 630 -> 636 (6 minutes)
    (travel-seg Pacific_Heights Marina_District t630 t636)

    ; Final wait / finish at Marina from 636 -> 690 (finish by 690)
    (wait-seg Marina_District t636 t690)

    ; Initialize cost accumulator
    (= (total-cost) 0)
  )

  ; Goal: finish at Marina at t690 and have completed the mandated meeting with Margaret 600->630
  (:goal (and
           (at orchestrator Marina_District t690)
           (met Margaret t600 t630)
         )
  )

  ; Minimize total travel time (sum of travel-seg costs: 7 + 6 = 13)
  (:metric minimize (total-cost))
)