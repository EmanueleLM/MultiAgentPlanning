(define (problem meet-margaret-validated)
  (:domain meeting-scheduling)

  (:objects
    orchestrator - agent
    Margaret - friend
    Marina_District Pacific_Heights - location
    t0 t580 t587 t600 t630 t636 t690 - time
  )

  (:init
    ;; Initial agent location at 09:00 -> time t0
    (at orchestrator Marina_District t0)

    ;; Friend static location
    (friend-at Margaret Pacific_Heights)

    ;; Successor (temporal ordering) for the discrete timepoints used
    (succ t0 t580)
    (succ t580 t587)
    (succ t587 t600)
    (succ t600 t630)
    (succ t630 t636)
    (succ t636 t690)

    ;; Permitted segments encoding contiguous occupancy and exact directed travel durations:
    ;; Wait at Marina_District from t0 -> t580 (idle / positioned)
    (wait-seg Marina_District t0 t580)

    ;; Travel Marina_District -> Pacific_Heights from t580 -> t587 (7 minutes)
    (travel-seg Marina_District Pacific_Heights t580 t587)

    ;; Wait at Pacific_Heights from t587 -> t600 (pre-meeting slack)
    (wait-seg Pacific_Heights t587 t600)

    ;; Meeting segment for Margaret from t600 -> t630 (30 minutes).
    ;; This lies fully within Margaret's availability window (600..645) and meets the 15-minute minimum.
    (meet-seg Margaret t600 t630)

    ;; Travel Pacific_Heights -> Marina_District from t630 -> t636 (6 minutes)
    (travel-seg Pacific_Heights Marina_District t630 t636)

    ;; Final wait / finish at Marina_District from t636 -> t690 (finish by 20:30)
    (wait-seg Marina_District t636 t690)
  )

  (:goal (and
           (at orchestrator Marina_District t690)
           (met Margaret t600 t630)
         )
  )
)