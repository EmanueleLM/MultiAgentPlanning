(define (domain meeting-scheduling-combined)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot agent)

  (:predicates
    (slot ?s - slot)                    ; identifies valid 30-min slots
    (available ?s - slot)               ; slot is available for all participants
    (scheduled ?s - slot)               ; a meeting has been scheduled at slot ?s
    (meeting-scheduled)                 ; global flag: any meeting has been scheduled
    (scheduled-by ?a - agent ?s - slot) ; record which agent scheduled the slot (keeps actions distinct)
  )

  ;; Emily's scheduling action (distinct name from other agents)
  (:action schedule_by_emily
    :parameters (?s - slot)
    :precondition (and (slot ?s) (available ?s) (not (meeting-scheduled)))
    :effect (and
              (scheduled ?s)
              (meeting-scheduled)
              (not (available ?s))
              (scheduled-by emily ?s)
            )
  )

  ;; Julia's scheduling action (distinct name from other agents)
  (:action schedule_by_julia
    :parameters (?s - slot)
    :precondition (and (slot ?s) (available ?s) (not (meeting-scheduled)))
    :effect (and
              (scheduled ?s)
              (meeting-scheduled)
              (not (available ?s))
              (scheduled-by julia ?s)
            )
  )
)