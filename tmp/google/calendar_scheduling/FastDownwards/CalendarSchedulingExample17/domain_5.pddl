(define (domain meeting-scheduler-multiagent-fixed)
  (:requirements :typing)
  (:types time-slot person)
  (:constants margaret donna helen - person
              ts_1200 ts_1230 - time-slot)
  (:predicates
    (within-window ?t - time-slot)
    (blocked ?p - person ?t - time-slot)
    (selected-margaret-ts1200)
    (selected-margaret-ts1230)
    (selected-donna-ts1200)
    (selected-donna-ts1230)
    (selected-helen-ts1200)
    (selected-helen-ts1230)
    (meeting-scheduled)
  )

  (:action margaret-schedule-1200
    :precondition (and (within-window ts_1200)
                       (not (blocked margaret ts_1200))
                       (not (selected-margaret-ts1200)))
    :effect (selected-margaret-ts1200)
  )

  (:action margaret-schedule-1230
    :precondition (and (within-window ts_1230)
                       (not (blocked margaret ts_1230))
                       (not (selected-margaret-ts1230)))
    :effect (selected-margaret-ts1230)
  )

  (:action donna-schedule-1200
    :precondition (and (within-window ts_1200)
                       (not (blocked donna ts_1200))
                       (not (selected-donna-ts1200)))
    :effect (selected-donna-ts1200)
  )

  (:action donna-schedule-1230
    :precondition (and (within-window ts_1230)
                       (not (blocked donna ts_1230))
                       (not (selected-donna-ts1230)))
    :effect (selected-donna-ts1230)
  )

  (:action helen-schedule-1200
    :precondition (and (within-window ts_1200)
                       (not (blocked helen ts_1200))
                       (not (selected-helen-ts1200)))
    :effect (selected-helen-ts1200)
  )

  (:action helen-schedule-1230
    :precondition (and (within-window ts_1230)
                       (not (blocked helen ts_1230))
                       (not (selected-helen-ts1230)))
    :effect (selected-helen-ts1230)
  )

  (:action finalize-1200
    :precondition (and (selected-margaret-ts1200)
                       (selected-donna-ts1200)
                       (selected-helen-ts1200)
                       (not (meeting-scheduled)))
    :effect (meeting-scheduled)
  )

  (:action finalize-1230
    :precondition (and (selected-margaret-ts1230)
                       (selected-donna-ts1230)
                       (selected-helen-ts1230)
                       (not (meeting-scheduled)))
    :effect (meeting-scheduled)
  )
)