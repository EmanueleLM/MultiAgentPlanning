(define (domain meeting-scheduling-integrated)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types person timeslot)
  (:predicates
    ;; Agent 1 predicates
    (free-at ?p - person ?t - timeslot)
    (meeting-scheduled-agent1)
    (early ?t - timeslot)

    ;; Agent 2 predicates
    (slot2 ?s - timeslot)
    (free2 ?p - person ?s - timeslot)
    (common-available ?s - timeslot)
    (scheduled2 ?s - timeslot)
    (meeting-with2 ?p - person ?s - timeslot)

    ;; Agent 3 predicates
    (participant3 ?p - person)
    (free3 ?p - person ?s - timeslot)
    (scheduled3)
    (meeting-at3 ?s - timeslot)

    ;; Orchestrator/global predicates
    (meeting-scheduled-global)
    (meeting-at-global ?t - timeslot)
  )

  ;; Agent 1 scheduling actions (keeps agent1 resources distinct)
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
    :cost 0
  )

  ;; Agent 2 scheduling action
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
    :cost 0
  )

  ;; Agent 3 scheduling action
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
    :cost 0
  )

  ;; Global/orchestrator actions that commit a single timeslot.
  ;; Two variants: early (cost 1) and non-early (cost 0) to encode preference avoid-before-13:00.
  (:action schedule_global_early
    :parameters (?t - timeslot)
    :precondition (and
                    (not (meeting-scheduled-global))
                    (early ?t)
                    ;; agent1's requirements
                    (free-at gerald ?t)
                    (free-at roy ?t)
                    (free-at barbara ?t)
                    ;; agent2's requirements
                    (slot2 ?t)
                    (free2 roy ?t)
                    (common-available ?t)
                    ;; agent3's requirements
                    (free3 gerald ?t)
                    (free3 roy ?t)
                    (free3 barbara ?t)
                  )
    :effect (and
              ;; global booking markers
              (meeting-scheduled-global)
              (meeting-at-global ?t)

              ;; reflect booking in agent1's view
              (meeting-scheduled-agent1)
              (not (free-at gerald ?t))
              (not (free-at roy ?t))
              (not (free-at barbara ?t))

              ;; reflect booking in agent2's view
              (scheduled2 ?t)
              (meeting-with2 gerald ?t)
              (meeting-with2 barbara ?t)
              (not (free2 roy ?t))
              (not (common-available ?t))

              ;; reflect booking in agent3's view
              (scheduled3)
              (meeting-at3 ?t)
              (not (free3 gerald ?t))
              (not (free3 roy ?t))
              (not (free3 barbara ?t))
            )
    :cost 1
  )

  (:action schedule_global
    :parameters (?t - timeslot)
    :precondition (and
                    (not (meeting-scheduled-global))
                    (not (early ?t))
                    ;; agent1's requirements
                    (free-at gerald ?t)
                    (free-at roy ?t)
                    (free-at barbara ?t)
                    ;; agent2's requirements
                    (slot2 ?t)
                    (free2 roy ?t)
                    (common-available ?t)
                    ;; agent3's requirements
                    (free3 gerald ?t)
                    (free3 roy ?t)
                    (free3 barbara ?t)
                  )
    :effect (and
              ;; global booking markers
              (meeting-scheduled-global)
              (meeting-at-global ?t)

              ;; reflect booking in agent1's view
              (meeting-scheduled-agent1)
              (not (free-at gerald ?t))
              (not (free-at roy ?t))
              (not (free-at barbara ?t))

              ;; reflect booking in agent2's view
              (scheduled2 ?t)
              (meeting-with2 gerald ?t)
              (meeting-with2 barbara ?t)
              (not (free2 roy ?t))
              (not (common-available ?t))

              ;; reflect booking in agent3's view
              (scheduled3)
              (meeting-at3 ?t)
              (not (free3 gerald ?t))
              (not (free3 roy ?t))
              (not (free3 barbara ?t))
            )
    :cost 0
  )

)