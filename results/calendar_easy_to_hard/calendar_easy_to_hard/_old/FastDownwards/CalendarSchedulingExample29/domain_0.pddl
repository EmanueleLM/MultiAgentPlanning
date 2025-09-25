(define (domain meeting-scheduling-combined)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    ;; time adjacency (two naming variants used by agents)
    (next ?s1 - slot ?s2 - slot)
    (slot-next ?s1 - slot ?s2 - slot)

    ;; availability/busy predicates (different agents used different predicates)
    (free ?p - participant ?s - slot)
    (available ?p - participant ?s - slot)
    (busy ?p - participant ?s - slot)

    ;; meeting markers used by different agents
    (scheduled)             ; agent 1 effect
    (meeting-scheduled)     ; agent 2 & 3 effect
    (meeting-start ?s - slot)
    (meeting-at ?s - slot)
  )

  ;; Action from Agent 1 (keeps original semantics: checks free predicate)
  (:action schedule_agent1
    :parameters (?s ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (free madison ?s) (free madison ?s2)
      (free diana   ?s) (free diana   ?s2)
      (free shirley ?s) (free shirley ?s2)
    )
    :effect (and
      (scheduled)
      (meeting-start ?s)
    )
  )

  ;; Action from Agent 2 (keeps original semantics: uses slot-next and available, and removes availability)
  (:action schedule_agent2
    :parameters (?s ?s2 - slot ?p1 ?p2 ?p3 - participant)
    :precondition (and
      (slot-next ?s ?s2)
      (available ?p1 ?s) (available ?p1 ?s2)
      (available ?p2 ?s) (available ?p2 ?s2)
      (available ?p3 ?s) (available ?p3 ?s2)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (not (available ?p1 ?s)) (not (available ?p1 ?s2))
      (not (available ?p2 ?s)) (not (available ?p2 ?s2))
      (not (available ?p3 ?s)) (not (available ?p3 ?s2))
    )
  )

  ;; Action from Agent 3 (keeps original semantics: negative preconditions on busy)
  (:action schedule_agent3
    :parameters (?s ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (not (busy madison ?s)) (not (busy madison ?s2))
      (not (busy diana   ?s)) (not (busy diana   ?s2))
      (not (busy shirley ?s)) (not (busy shirley ?s2))
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)