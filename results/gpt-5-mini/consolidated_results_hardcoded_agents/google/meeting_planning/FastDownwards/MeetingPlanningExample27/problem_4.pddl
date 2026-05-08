(define (problem meet-margaret-validated)
  (:domain meeting-scheduling)

  (:objects
    orchestrator - agent
    Margaret - friend
    Marina_District Pacific_Heights - location
    t0 t580 t587 t600 t630 t636 t690 - time
  )

  (:init
    ;; Initial agent location at 09:00 -> time t0 (0 minutes)
    (at orchestrator Marina_District t0)

    ;; Friend static location (Margaret at Pacific Heights)
    (friend-at Margaret Pacific_Heights)

    ;; Explicit permitted contiguous segments encoding the chosen feasible schedule:
    ;; Wait at Marina_District from t0 -> t580 (idle / positioned until travel)
    (wait-seg Marina_District t0 t580)

    ;; Travel Marina_District -> Pacific_Heights from t580 -> t587 (7 minutes)
    (travel-seg Marina_District Pacific_Heights t580 t587)

    ;; Wait at Pacific_Heights from t587 -> t600 (pre-meeting slack)
    (wait-seg Pacific_Heights t587 t600)

    ;; Meeting segment for Margaret from t600 -> t630 (30 minutes; within 600..645 and >=15)
    (meet-seg Margaret t600 t630)

    ;; Travel back Pacific_Heights -> Marina_District from t630 -> t636 (6 minutes)
    (travel-seg Pacific_Heights Marina_District t630 t636)

    ;; Wait at Marina_District from t636 -> t690 (end-of-day slack, finish by 20:30)
    (wait-seg Marina_District t636 t690)
  )

  (:goal (and
           ;; Mandatory completion: successful meeting with Margaret and finishing at Marina_District at t690
           (met Margaret t600 t630)
           (at orchestrator Marina_District t690)
         )
  )
)