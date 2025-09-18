(define (domain meeting-scheduling-integrated)
  (:requirements :strips :typing :negative-preconditions :equality :action-costs)
  (:types person timeslot)
  (:constants gerald roy barbara - person)
  (:predicates
    (free-at ?p - person ?t - timeslot)
    (meeting-scheduled-agent1)
    (early ?t - timeslot)

    (slot2 ?s - timeslot)
    (free2 ?p - person ?s - timeslot)
    (common-available ?s - timeslot)
    (scheduled2 ?s - timeslot)
    (meeting-with2 ?p - person ?s - timeslot)

    (participant3 ?p - person)
    (free3 ?p - person ?s - timeslot)
    (scheduled3)
    (meeting-at3 ?s - timeslot)

    (meeting-scheduled-global)
    (meeting-at-global ?t - timeslot)
  )

  ;; Scheduling action across agent1's view (Gerald)
  (:action schedule_agent1
    :parameters (?t - timeslot)
    :precondition (and
                    (not (meeting-scheduled-agent1))
                    (free-at gerald ?t)
                    (free-at roy ?t)
                    (free-at barbara ?t)
                  )
    :effect (and
              (meeting-scheduled-agent1)
              (not (free-at gerald ?t))
              (not (free-at roy ?t))
              (not (free-at barbara ?t))
            )
  )

  ;; Scheduling action in agent2 fragment (Roy) using slot2 and free2/common-available
  (:action schedule_meeting_agent2
    :parameters (?s - timeslot)
    :precondition (and
                    (slot2 ?s)
                    (free2 roy ?s)
                    (common-available ?s)
                  )
    :effect (and
              (scheduled2 ?s)
              (meeting-with2 gerald ?s)
              (meeting-with2 barbara ?s)
            )
  )

  ;; Scheduling action in agent3 fragment (Barbara)
  (:action schedule_agent3
    :parameters (?s - timeslot ?organizer - person ?p1 - person ?p2 - person)
    :precondition (and
                    (not (scheduled3))
                    (free3 ?organizer ?s)
                    (free3 ?p1 ?s)
                    (free3 ?p2 ?s)
                  )
    :effect (and
             (scheduled3)
             (meeting-at3 ?s)
            )
  )

  ;; Orchestrator action for scheduling at an "early" slot (captures preference)
  (:action schedule_global_early
    :parameters (?t - timeslot)
    :precondition (and
                    (not (meeting-scheduled-global))
                    (early ?t)
                    (free-at gerald ?t)
                    (free-at roy ?t)
                    (free-at barbara ?t)
                    (slot2 ?t)
                    (free2 roy ?t)
                    (common-available ?t)
                    (free3 gerald ?t)
                    (free3 roy ?t)
                    (free3 barbara ?t)
                  )
    :effect (and
              (meeting-scheduled-global)
              (meeting-at-global ?t)

              (meeting-scheduled-agent1)
              (not (free-at gerald ?t))
              (not (free-at roy ?t))
              (not (free-at barbara ?t))

              (scheduled2 ?t)
              (meeting-with2 gerald ?t)
              (meeting-with2 barbara ?t)
              (not (free2 roy ?t))
              (not (common-available ?t))

              (scheduled3)
              (meeting-at3 ?t)
              (not (free3 gerald ?t))
              (not (free3 roy ?t))
              (not (free3 barbara ?t))
            )
  )

  ;; Orchestrator action for scheduling at a non-early slot
  (:action schedule_global
    :parameters (?t - timeslot)
    :precondition (and
                    (not (meeting-scheduled-global))
                    (not (early ?t))
                    (free-at gerald ?t)
                    (free-at roy ?t)
                    (free-at barbara ?t)
                    (slot2 ?t)
                    (free2 roy ?t)
                    (common-available ?t)
                    (free3 gerald ?t)
                    (free3 roy ?t)
                    (free3 barbara ?t)
                  )
    :effect (and
              (meeting-scheduled-global)
              (meeting-at-global ?t)

              (meeting-scheduled-agent1)
              (not (free-at gerald ?t))
              (not (free-at roy ?t))
              (not (free-at barbara ?t))

              (scheduled2 ?t)
              (meeting-with2 gerald ?t)
              (meeting-with2 barbara ?t)
              (not (free2 roy ?t))
              (not (common-available ?t))

              (scheduled3)
              (meeting-at3 ?t)
              (not (free3 gerald ?t))
              (not (free3 roy ?t))
              (not (free3 barbara ?t))
            )
  )

)