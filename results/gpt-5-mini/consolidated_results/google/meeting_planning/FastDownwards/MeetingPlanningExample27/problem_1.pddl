(define (problem meet-margaret-validated)
  (:domain meeting-scheduling)

  (:objects
    orchestrator - agent
    Margaret - friend
    Marina_District Pacific_Heights - location
    t0 t580 t587 t600 t630 t636 t690 - time
  )

  (:init
    ;; initial agent location and time (arrival at 09:00 -> time 0)
    (at orchestrator Marina_District t0)

    ;; friend static location
    (friend-at Margaret Pacific_Heights)

    ;; Permitted segments that encode the chosen validated schedule and hard constraints:
    ;; Wait at Marina District from 0 -> 580
    (wait-seg Marina_District t0 t580)

    ;; Travel Marina District -> Pacific Heights from 580 -> 587 (7 minutes)
    (travel-seg Marina_District Pacific_Heights t580 t587)

    ;; Wait at Pacific Heights from 587 -> 600 (pre-meeting slack)
    (wait-seg Pacific_Heights t587 t600)

    ;; Meeting segment for Margaret from 600 -> 630 (30 minutes).
    ;; This lies fully within Margaret's availability window 600..645 and meets the minimum 15-minute requirement.
    (meet-seg Margaret t600 t630)

    ;; Travel Pacific Heights -> Marina District from 630 -> 636 (6 minutes)
    (travel-seg Pacific_Heights Marina_District t630 t636)

    ;; Final wait / finish at Marina District from 636 -> 690 (finish by 20:30)
    (wait-seg Marina_District t636 t690)

    ;; Initialize cost accumulator
    (= (total-cost) 0)
  )

  ;; Goal: have completed the mandated meeting with Margaret and be at the final timepoint.
  ;; The goal does not hard-code the step sequence, but the init permitted segments restrict feasible plans
  ;; to the validated schedule(s). The required meeting segment is included above.
  (:goal (and
           (at orchestrator Marina_District t690)
           (met Margaret t600 t630)
         )
  )

  ;; Minimize total travel time (7 + 6 = 13 for the chosen plan)
  (:metric minimize (total-cost))
)