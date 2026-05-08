(define (domain blocksworld-scaling28)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent stage)

  (:predicates
    ;; spatial relations
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)

    ;; hand state (single hand shared by agents)
    (holding ?b - block)
    (handempty)

    ;; agent role markers to label which agent may perform which actions
    (is-picker ?a - agent)
    (is-stacker ?a - agent)
    (is-auditor ?a - agent)
    (is-orchestrator ?a - agent)

    ;; explicit discrete time/stage progression
    (current-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Picker actions: PickUp (from table) and Unstack (from another block)
  (:action pickup
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (is-picker ?ag)
      (handempty)
      (clear ?b)
      (ontable ?b)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))        ; picked-up blocks are not "clear" by definition
      (not (handempty))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action unstack
    :parameters (?ag - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (is-picker ?ag)
      (handempty)
      (on ?b ?c)
      (clear ?b)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?c))
      (not (clear ?b))       ; held blocks are not clear
      (not (handempty))
      (clear ?c)             ; removing top makes support clear
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Stacker actions: PutDown (to table) and Stack (onto another block)
  (:action putdown
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (is-stacker ?ag)
      (holding ?b)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action stack
    :parameters (?ag - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (is-stacker ?ag)
      (holding ?b)
      (clear ?c)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (on ?b ?c)
      (not (clear ?c))      ; destination becomes not clear after stacking
      (clear ?b)            ; newly stacked block top is clear
      (handempty)
      (not (holding ?b))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)