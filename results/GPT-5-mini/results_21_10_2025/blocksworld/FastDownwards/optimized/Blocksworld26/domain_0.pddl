(define (domain combined_blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (handempty)
    (holding ?b - block)
  )

  ;; Vowel-agent actions (namespaced with "vowel-")
  ;; The vowel agent may only move blocks marked (vowel ?b).
  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?to))
      (on ?b ?to)
      (clear ?b)
    )
  )

  (:action vowel-move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (clear ?from)
      (not (clear ?to))
      (on ?b ?to)
      (clear ?b)
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (clear ?from)
      (not (on ?b ?from))
    )
  )

  ;; Consonant-agent actions (namespaced with "cons-")
  ;; The consonant agent may only pick/unstack/put/stack blocks marked (consonant ?b).
  ;; The stacking action is relaxed so the destination can be any clear block (consonant or vowel).
  (:action cons-pickup
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  (:action cons-unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?c))
      (holding ?b)
      (clear ?c)
      (not (handempty))
    )
  )

  (:action cons-putdown
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  (:action cons-stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (consonant ?b)
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?c))
    )
  )
)