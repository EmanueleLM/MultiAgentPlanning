(define (problem meet-margaret-validated)
  (:domain meeting-scheduling)

  (:objects
    orchestrator - agent
    Margaret - friend
    Marina_District Pacific_Heights - location
    t0 t580 t587 t600 t630 - time
  )

  (:init
    ;; Initial agent location at 09:00 -> time t0
    (at orchestrator Marina_District t0)

    ;; Friend static location
    (friend-at Margaret Pacific_Heights)

    ;; Permitted segments encoding the chosen feasible schedule:
    ;; Wait at Marina_District from t0 -> t580 (idle / positioned)
    (wait-seg Marina_District t0 t580)

    ;; Travel Marina_District -> Pacific_Heights from t580 -> t587 (7 minutes)
    (travel-seg Marina_District Pacific_Heights t580 t587)

    ;; Wait at Pacific_Heights from t587 -> t600 (pre-meeting slack)
    (wait-seg Pacific_Heights t587 t600)

    ;; Meeting segment for Margaret from t600 -> t630 (30 minutes; >= 15 min and within 600..645)
    (meet-seg Margaret t600 t630)
  )

  (:goal (and
           (met Margaret t600 t630)
         )
  )
)