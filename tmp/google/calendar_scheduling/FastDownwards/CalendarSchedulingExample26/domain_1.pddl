(define (domain coordinated-meeting-scheduler)
  (:requirements :typing)
  (:types meeting time_slot person)

  (:predicates
    (scheduled-agt1 ?m - meeting)
    (start-agt1 ?m - meeting ?t - time_slot)

    (free-slot-agt2 ?s - time_slot)
    (meeting-at-agt2 ?s - time_slot)

    (busy-kevin-agt3 ?p - person ?t - time_slot)
    (next-slot-agt3 ?t1 - time_slot ?t2 - time_slot)
    (meeting_at-agt3 ?start - time_slot)
    (meeting_scheduled-agt3)
  )

  (:constants
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330
    t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    kevin - person
  )

  ; Agent 1: simple one-shot scheduling
  (:action schedule-meeting-agt1
    :parameters (?m - meeting ?t - time_slot)
    :precondition (not (scheduled-agt1 ?m))
    :effect (and
      (scheduled-agt1 ?m)
      (start-agt1 ?m ?t)
    )
  )

  ; Agent 2: sequence of 15 possible 60-minute blocks (each block uses two consecutive 30-min slots)
  (:action schedule-agt2-s0
    :parameters ()
    :precondition (and (free-slot-agt2 t0900) (free-slot-agt2 t0930))
    :effect (and (not (free-slot-agt2 t0900)) (not (free-slot-agt2 t0930)) (meeting-at-agt2 t0900))
  )
  (:action schedule-agt2-s1
    :parameters ()
    :precondition (and (free-slot-agt2 t0930) (free-slot-agt2 t1000))
    :effect (and (not (free-slot-agt2 t0930)) (not (free-slot-agt2 t1000)) (meeting-at-agt2 t0930))
  )
  (:action schedule-agt2-s2
    :parameters ()
    :precondition (and (free-slot-agt2 t1000) (free-slot-agt2 t1030))
    :effect (and (not (free-slot-agt2 t1000)) (not (free-slot-agt2 t1030)) (meeting-at-agt2 t1000))
  )
  (:action schedule-agt2-s3
    :parameters ()
    :precondition (and (free-slot-agt2 t1030) (free-slot-agt2 t1100))
    :effect (and (not (free-slot-agt2 t1030)) (not (free-slot-agt2 t1100)) (meeting-at-agt2 t1030))
  )
  (:action schedule-agt2-s4
    :parameters ()
    :precondition (and (free-slot-agt2 t1100) (free-slot-agt2 t1130))
    :effect (and (not (free-slot-agt2 t1100)) (not (free-slot-agt2 t1130)) (meeting-at-agt2 t1100))
  )
  (:action schedule-agt2-s5
    :parameters ()
    :precondition (and (free-slot-agt2 t1130) (free-slot-agt2 t1200))
    :effect (and (not (free-slot-agt2 t1130)) (not (free-slot-agt2 t1200)) (meeting-at-agt2 t1130))
  )
  (:action schedule-agt2-s6
    :parameters ()
    :precondition (and (free-slot-agt2 t1200) (free-slot-agt2 t1230))
    :effect (and (not (free-slot-agt2 t1200)) (not (free-slot-agt2 t1230)) (meeting-at-agt2 t1200))
  )
  (:action schedule-agt2-s7
    :parameters ()
    :precondition (and (free-slot-agt2 t1230) (free-slot-agt2 t1300))
    :effect (and (not (free-slot-agt2 t1230)) (not (free-slot-agt2 t1300)) (meeting-at-agt2 t1230))
  )
  (:action schedule-agt2-s8
    :parameters ()
    :precondition (and (free-slot-agt2 t1300) (free-slot-agt2 t1330))
    :effect (and (not (free-slot-agt2 t1300)) (not (free-slot-agt2 t1330)) (meeting-at-agt2 t1300))
  )
  (:action schedule-agt2-s9
    :parameters ()
    :precondition (and (free-slot-agt2 t1330) (free-slot-agt2 t1400))
    :effect (and (not (free-slot-agt2 t1330)) (not (free-slot-agt2 t1400)) (meeting-at-agt2 t1330))
  )
  (:action schedule-agt2-s10
    :parameters ()
    :precondition (and (free-slot-agt2 t1400) (free-slot-agt2 t1430))
    :effect (and (not (free-slot-agt2 t1400)) (not (free-slot-agt2 t1430)) (meeting-at-agt2 t1400))
  )
  (:action schedule-agt2-s11
    :parameters ()
    :precondition (and (free-slot-agt2 t1430) (free-slot-agt2 t1500))
    :effect (and (not (free-slot-agt2 t1430)) (not (free-slot-agt2 t1500)) (meeting-at-agt2 t1430))
  )
  (:action schedule-agt2-s12
    :parameters ()
    :precondition (and (free-slot-agt2 t1500) (free-slot-agt2 t1530))
    :effect (and (not (free-slot-agt2 t1500)) (not (free-slot-agt2 t1530)) (meeting-at-agt2 t1500))
  )
  (:action schedule-agt2-s13
    :parameters ()
    :precondition (and (free-slot-agt2 t1530) (free-slot-agt2 t1600))
    :effect (and (not (free-slot-agt2 t1530)) (not (free-slot-agt2 t1600)) (meeting-at-agt2 t1530))
  )
  (:action schedule-agt2-s14
    :parameters ()
    :precondition (and (free-slot-agt2 t1600) (free-slot-agt2 t1630))
    :effect (and (not (free-slot-agt2 t1600)) (not (free-slot-agt2 t1630)) (meeting-at-agt2 t1600))
  )

  ; Agent 3: meeting scheduling with Kevin's availability
  (:action schedule-meeting-agt3
    :parameters (?start - time_slot ?next - time_slot)
    :precondition (and
      (not (meeting_scheduled-agt3))
      (not (busy-kevin-agt3 kevin ?start))
      (not (busy-kevin-agt3 kevin ?next))
      (next-slot-agt3 ?start ?next))
    :effect (and
      (meeting_at-agt3 ?start)
      (meeting_scheduled-agt3))
  )
)