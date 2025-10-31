(define (domain blocks_multi_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?s - block)         ; ?b is directly on ?s
    (ontable ?b - block)               ; ?b is directly on the table
    (clear ?b - block)                 ; nothing on ?b; ?b is top of its stack
    (vowel ?b - block)                 ; block is a vowel (movable by vowel_agent)
    (consonant ?b - block)             ; block is a consonant (movable by consonant_agent)
    (holding_vowel ?b - block)         ; vowel_agent is holding ?b
    (handempty_vowel)                  ; vowel_agent's hand is empty
  )

  ;; ========================
  ;; VOWEL AGENT ACTIONS
  ;; The vowel agent has an explicit hand: holding_vowel, handempty_vowel.
  ;; The vowel agent may only move blocks with predicate (vowel ?b).
  ;; ========================

  (:action vowel-pickup-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty_vowel))
    :effect (and
              (not (ontable ?b))
              (holding_vowel ?b)
              (not (handempty_vowel))
              (not (clear ?b))
            )
  )

  (:action vowel-unstack-from-block
    :parameters (?b - block ?y - block)
    :precondition (and (vowel ?b) (on ?b ?y) (clear ?b) (handempty_vowel))
    :effect (and
              (not (on ?b ?y))
              (holding_vowel ?b)
              (not (handempty_vowel))
              (clear ?y)
              (not (clear ?b))
            )
  )

  (:action vowel-put-on-block
    :parameters (?b - block ?t - block)
    :precondition (and (vowel ?b) (holding_vowel ?b) (clear ?t) (not (= ?b ?t)))
    :effect (and
              (not (holding_vowel ?b))
              (on ?b ?t)
              (handempty_vowel)
              (not (clear ?t))
              (clear ?b)
            )
  )

  (:action vowel-put-on-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding_vowel ?b))
    :effect (and
              (not (holding_vowel ?b))
              (ontable ?b)
              (handempty_vowel)
              (clear ?b)
            )
  )

  ;; ========================
  ;; CONSONANT AGENT ACTIONS
  ;; The consonant agent may only move blocks with predicate (consonant ?x).
  ;; Consonant moves are atomic (no explicit holding state).
  ;; ========================

  (:action consonant-move-onto-block-from-table
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?x) (clear ?y) (not (= ?x ?y)))
    :effect (and
              (not (ontable ?x))
              (on ?x ?y)
              (not (clear ?y))
              (clear ?x)
            )
  )

  (:action consonant-move-onto-block-from-block
    :parameters (?x - block ?z - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?z) (clear ?x) (clear ?y) (not (= ?x ?y)))
    :effect (and
              (not (on ?x ?z))
              (on ?x ?y)
              (clear ?z)
              (not (clear ?y))
              (clear ?x)
            )
  )

  (:action consonant-move-to-table-from-block
    :parameters (?x - block ?z - block)
    :precondition (and (consonant ?x) (on ?x ?z) (clear ?x))
    :effect (and
              (not (on ?x ?z))
              (ontable ?x)
              (clear ?z)
              (clear ?x)
            )
  )
)