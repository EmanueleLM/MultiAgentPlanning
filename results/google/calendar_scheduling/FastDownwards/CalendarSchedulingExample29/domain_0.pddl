(define (domain meeting-scheduling)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (slot ?s)
    (next ?s1 ?s2)
    (free ?agent ?s)
    (attending ?agent ?s)
    (meeting-scheduled ?s)
  )

  ;; Madison's action to mark availability for a half-hour slot
  (:action madison-attend
    :parameters (?s)
    :precondition (free madison ?s)
    :effect (attending madison ?s)
  )

  ;; Diana's action to mark availability for a half-hour slot
  (:action diana-attend
    :parameters (?s)
    :precondition (free diana ?s)
    :effect (attending diana ?s)
  )

  ;; Shirley's action to mark availability for a half-hour slot
  (:action shirley-attend
    :parameters (?s)
    :precondition (free shirley ?s)
    :effect (attending shirley ?s)
  )

  ;; Finalize/schedule the 60-minute meeting starting at ?s, requiring both consecutive half-hour slots
  (:action finalize-meeting
    :parameters (?s ?s2)
    :precondition (and
      (next ?s ?s2)
      (attending madison ?s) (attending madison ?s2)
      (attending diana ?s)   (attending diana ?s2)
      (attending shirley ?s) (attending shirley ?s2)
      (not (meeting-scheduled ?s))
    )
    :effect (meeting-scheduled ?s)
  )
)