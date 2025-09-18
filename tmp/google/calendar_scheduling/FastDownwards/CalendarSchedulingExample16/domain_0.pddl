(define (domain multi_agent_scheduling)
  (:requirements :typing :adl)
  (:types person slot meeting)

  (:predicates
    ;; Agent 1 (Scott) predicates (namespaced with a1_)
    (a1_slot ?s - slot)
    (a1_free ?p - person ?s - slot)
    (a1_scheduled ?p - person ?s - slot)
    (a1_meeting_scheduled)

    ;; Agent 2 (Gabriel) predicates (namespaced with g_)
    (g_work-slot ?s - slot)
    (g_slot-free ?s - slot)
    (g_no-meetings-monday)
    (g_scheduled ?m - meeting ?s - slot)
    (g_meeting-duration-30)
    (g_time-granularity-30)
    (g_exists-solution)

    ;; Agent 3 (Christine) predicates (namespaced with c_)
    (c_slot ?s - slot)
    (c_work-slot ?s - slot)
    (c_busy ?s - slot)
    (c_scheduled ?s - slot)
    (c_meeting_scheduled)
  )

  ;; Agent 1 scheduling action (Scott)
  (:action a1_schedule
    :parameters (?p - person ?s - slot)
    :precondition (and (a1_slot ?s) (a1_free ?p ?s))
    :effect (and
              (a1_scheduled ?p ?s)
              (a1_meeting_scheduled)
              (not (a1_free ?p ?s))
            )
  )

  ;; Agent 2: an action to clear the "no meetings on Monday" policy (orchestrator-step to allow scheduling)
  (:action g_clear_no_meetings
    :parameters ()
    :precondition (g_no-meetings-monday)
    :effect (not (g_no-meetings-monday))
  )

  ;; Agent 2 scheduling action (Gabriel)
  (:action g_schedule
    :parameters (?m - meeting ?s - slot)
    :precondition (and
                    (g_work-slot ?s)
                    (g_slot-free ?s)
                    (not (g_no-meetings-monday))
                  )
    :effect (and
              (g_scheduled ?m ?s)
              (not (g_slot-free ?s))
            )
  )

  ;; Agent 3 scheduling action (Christine)
  (:action c_schedule
    :parameters (?s - slot)
    :precondition (and
                    (c_slot ?s)
                    (c_work-slot ?s)
                    (not (c_busy ?s))
                    (not (c_scheduled ?s))
                  )
    :effect (and
              (c_scheduled ?s)
              (c_meeting_scheduled)
            )
  )
)