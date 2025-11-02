(define (domain multiagent-blocks-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?x - block)        ; ?b is on top of block ?x
    (ontable ?b - block)              ; ?b is on the table
    (clear ?b - block)                ; nothing on top of ?b
    (holding-vowel ?b - block)        ; vowel_agent is holding ?b
    (holding-cons ?b - block)         ; consonant_agent is holding ?b
    (handempty-vowel)                 ; vowel_agent's hand is empty
    (handempty-cons)                  ; consonant_agent's hand is empty
    (vowel ?b - block)                ; block is vowel-labelled (A, E, I)
    (can-manipulate ?b - block)       ; consonant_agent can manipulate this block
    (goal-reached)                    ; orchestrator success marker
  )

  ;; Vowel agent actions (namespaced: vowel-*)
  (:action vowel-pick-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty-vowel))
    :effect (and
      (holding-vowel ?b)
      (not (ontable ?b))
      (not (handempty-vowel))
      (not (clear ?b))
    )
  )

  (:action vowel-pick-from-block
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (on ?b ?under) (clear ?b) (handempty-vowel))
    :effect (and
      (holding-vowel ?b)
      (clear ?under)
      (not (on ?b ?under))
      (not (handempty-vowel))
      (not (clear ?b))
    )
  )

  (:action vowel-place-on-table
    :parameters (?b - block)
    :precondition (and (holding-vowel ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty-vowel)
      (not (holding-vowel ?b))
    )
  )

  (:action vowel-place-on-block
    :parameters (?b - block ?target - block)
    :precondition (and (holding-vowel ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (handempty-vowel)
      (not (holding-vowel ?b))
    )
  )

  ;; Consonant agent actions (namespaced: cons-*)
  (:action cons-pickup-from-table
    :parameters (?b - block)
    :precondition (and (can-manipulate ?b) (ontable ?b) (clear ?b) (handempty-cons))
    :effect (and
      (holding-cons ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty-cons))
    )
  )

  (:action cons-pickup-from-block
    :parameters (?b - block ?under - block)
    :precondition (and (can-manipulate ?b) (on ?b ?under) (clear ?b) (handempty-cons))
    :effect (and
      (holding-cons ?b)
      (clear ?under)
      (not (on ?b ?under))
      (not (clear ?b))
      (not (handempty-cons))
    )
  )

  (:action cons-putdown-on-table
    :parameters (?b - block)
    :precondition (and (holding-cons ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty-cons)
      (not (holding-cons ?b))
    )
  )

  (:action cons-putdown-on-block
    :parameters (?b - block ?target - block)
    :precondition (and (holding-cons ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (handempty-cons)
      (not (holding-cons ?b))
    )
  )

  ;; Orchestrator action: only available when final tower exists; sets an explicit goal marker.
  ;; The final tower conditions are required as preconditions so that the planner must achieve them before this action.
  (:action orchestrator-announce-success
    :parameters ()
    :precondition (and
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (ontable J)
      (handempty-vowel)
      (handempty-cons)
    )
    :effect (and
      (goal-reached)
    )
  )
)