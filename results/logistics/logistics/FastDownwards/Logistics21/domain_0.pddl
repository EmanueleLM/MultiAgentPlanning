(define (domain multiagent-tasks)
  (:requirements :strips :typing)
  (:types agent slot)

  (:predicates
    (agent ?a - agent)
    (slot ?s - slot)
    (slot-free ?s - slot)
    (earliest ?s - slot)
    (next ?s ?ns - slot)

    ;; completion predicates for each action per agent
    (paltry-done ?a - agent)
    (sip-done ?a - agent)
    (clip-done ?a - agent)
    (wretched-done ?a - agent)
    (memory-done ?a - agent)
    (tightfisted-done ?a - agent)
  )

  ;; Actions belonging to planner_a (kept distinct)
  ;; Version that consumes a slot and advances earliest using next relation
  (:action a-paltry
    :parameters (?a - agent ?s - slot ?ns - slot)
    :precondition (and (agent ?a) (slot ?s) (slot-free ?s) (earliest ?s) (next ?s ?ns) (not (paltry-done ?a)))
    :effect (and
      (not (slot-free ?s))
      (not (earliest ?s))
      (earliest ?ns)
      (paltry-done ?a)
    )
  )
  ;; Final-slot variant (no successor)
  (:action a-paltry-final
    :parameters (?a - agent ?s - slot)
    :precondition (and (agent ?a) (slot ?s) (slot-free ?s) (earliest ?s) (not (paltry-done ?a)))
    :effect (and
      (not (slot-free ?s))
      (not (earliest ?s))
      (paltry-done ?a)
    )
  )

  (:action a-sip
    :parameters (?a - agent ?s - slot ?ns - slot)
    :precondition (and (agent ?a) (slot ?s) (slot-free ?s) (earliest ?s) (next ?s ?ns) (not (sip-done ?a)))
    :effect (and
      (not (slot-free ?s))
      (not (earliest ?s))
      (earliest ?ns)
      (sip-done ?a)
    )
  )
  (:action a-sip-final
    :parameters (?a - agent ?s - slot)
    :precondition (and (agent ?a) (slot ?s) (slot-free ?s) (earliest ?s) (not (sip-done ?a)))
    :effect (and
      (not (slot-free ?s))
      (not (earliest ?s))
      (sip-done ?a)
    )
  )

  (:action a-clip
    :parameters (?a - agent ?s - slot ?ns - slot)
    :precondition (and (agent ?a) (slot ?s) (slot-free ?s) (earliest ?s) (next ?s ?ns) (not (clip-done ?a)))
    :effect (and
      (not (slot-free ?s))
      (not (earliest ?s))
      (earliest ?ns)
      (clip-done ?a)
    )
  )
  (:action a-clip-final
    :parameters (?a - agent ?s - slot)
    :precondition (and (agent ?a) (slot ?s) (slot-free ?s) (earliest ?s) (not (clip-done ?a)))
    :effect (and
      (not (slot-free ?s))
      (not (earliest ?s))
      (clip-done ?a)
    )
  )

  ;; Actions belonging to planner_b (kept distinct)
  (:action b-wretched
    :parameters (?b - agent ?s - slot ?ns - slot)
    :precondition (and (agent ?b) (slot ?s) (slot-free ?s) (earliest ?s) (next ?s ?ns) (not (wretched-done ?b)))
    :effect (and
      (not (slot-free ?s))
      (not (earliest ?s))
      (earliest ?ns)
      (wretched-done ?b)
    )
  )
  (:action b-wretched-final
    :parameters (?b - agent ?s - slot)
    :precondition (and (agent ?b) (slot ?s) (slot-free ?s) (earliest ?s) (not (wretched-done ?b)))
    :effect (and
      (not (slot-free ?s))
      (not (earliest ?s))
      (wretched-done ?b)
    )
  )

  (:action b-memory
    :parameters (?b - agent ?s - slot ?ns - slot)
    :precondition (and (agent ?b) (slot ?s) (slot-free ?s) (earliest ?s) (next ?s ?ns) (not (memory-done ?b)))
    :effect (and
      (not (slot-free ?s))
      (not (earliest ?s))
      (earliest ?ns)
      (memory-done ?b)
    )
  )
  (:action b-memory-final
    :parameters (?b - agent ?s - slot)
    :precondition (and (agent ?b) (slot ?s) (slot-free ?s) (earliest ?s) (not (memory-done ?b)))
    :effect (and
      (not (slot-free ?s))
      (not (earliest ?s))
      (memory-done ?b)
    )
  )

  (:action b-tightfisted
    :parameters (?b - agent ?s - slot ?ns - slot)
    :precondition (and (agent ?b) (slot ?s) (slot-free ?s) (earliest ?s) (next ?s ?ns) (not (tightfisted-done ?b)))
    :effect (and
      (not (slot-free ?s))
      (not (earliest ?s))
      (earliest ?ns)
      (tightfisted-done ?b)
    )
  )
  (:action b-tightfisted-final
    :parameters (?b - agent ?s - slot)
    :precondition (and (agent ?b) (slot ?s) (slot-free ?s) (earliest ?s) (not (tightfisted-done ?b)))
    :effect (and
      (not (slot-free ?s))
      (not (earliest ?s))
      (tightfisted-done ?b)
    )
  )
)