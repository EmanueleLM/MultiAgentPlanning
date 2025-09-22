(define (domain meeting-scheduling-integrated)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :fluents)
  (:types person timeslot)
  (:predicates
    ;; Agent 1 (original agent1) predicates
    (free-at ?p - person ?t - timeslot)        ; agent1: person free at timeslot
    (meeting-scheduled-agent1)                 ; agent1: meeting scheduled marker
    (early ?t - timeslot)                      ; agent1: timeslot before 13:00

    ;; Agent 2 (original agent2) predicates
    (slot2 ?s - timeslot)                      ; agent2: slot type/marker
    (free2 ?p - person ?s - timeslot)          ; agent2: person free at slot
    (common-available ?s - timeslot)           ; agent2: claimed common available slot
    (scheduled2 ?s - timeslot)                 ; agent2: meeting scheduled at slot
    (meeting-with2 ?p - person ?s - timeslot)  ; agent2: meeting includes person at slot

    ;; Agent 3 (original agent3) predicates
    (participant3 ?p - person)
    (free3 ?p - person ?s - timeslot)          ; agent3: person free at slot
    (scheduled3)                               ; agent3: meeting scheduled marker
    (meeting-at3 ?s - timeslot)                ; agent3: meeting at slot

    ;; Orchestrator/global predicates (keeps agents' resources distinct)
    (meeting-scheduled-global)
    (meeting-at-global ?t - timeslot)
  )

  (:functions
    (total-cost-agent1)   ; numeric soft cost from agent1 preferences (avoid before 13:00)
  )

  ;; Agent 1 scheduling action (keeps agent1 resources distinct)
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
              ;; soft preference: increase cost if scheduled before 13:00
              (when (early ?t) (increase (total-cost-agent1) 1))
            )
  )

  ;; Agent 2 scheduling action (keeps agent2 resources distinct)
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

  ;; Agent 3 scheduling action (keeps agent3 resources distinct)
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

  ;; Global/orchestrator action that commits a single timeslot satisfying all agents' constraints.
  ;; This action is added to ensure a single consistent meeting time across the different agents'
  ;; private predicates. It keeps agent actions/resources distinct but enforces a common slot.
  (:action schedule_global
    :parameters (?t - timeslot)
    :precondition (and
                    (not (meeting-scheduled-global))
                    ;; agent1's requirements (Gerald, Roy, Barbara must be free according to agent1)
                    (free-at gerald ?t)
                    (free-at roy ?t)
                    (free-at barbara ?t)
                    ;; agent2's requirements (slot marker, Roy free according to agent2, and the common-available slot)
                    (slot2 ?t)
                    (free2 roy ?t)
                    (common-available ?t)
                    ;; agent3's requirements (all three participants free according to agent3)
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
              ;; agent1 soft preference cost
              (when (early ?t) (increase (total-cost-agent1) 1))

              ;; reflect booking in agent2's view
              (scheduled2 ?t)
              (meeting-with2 gerald ?t)
              (meeting-with2 barbara ?t)
              (not (free2 roy ?t))
              ;; also remove common-available for that slot (optional bookkeeping)
              (not (common-available ?t))

              ;; reflect booking in agent3's view
              (scheduled3)
              (meeting-at3 ?t)
              (not (free3 gerald ?t))
              (not (free3 roy ?t))
              (not (free3 barbara ?t))
            )
  )

)