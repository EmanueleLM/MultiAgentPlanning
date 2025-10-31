(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (different ?x - block ?y - block)
  )

  ;; Vowel agent actions: may only move vowel blocks (A, E, I)
  (:action vowel-move-from-on-to-block
    :parameters (?b - vowel ?under - block ?dest - block)
    :precondition (and (on ?b ?under) (clear ?b) (clear ?dest) (different ?b ?dest))
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?dest))
      (on ?b ?dest)
      (clear ?b)
    )
  )

  (:action vowel-move-from-on-to-table
    :parameters (?b - vowel ?under - block)
    :precondition (and (on ?b ?under) (clear ?b))
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (ontable ?b)
      (clear ?b)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?b - vowel ?dest - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?dest) (different ?b ?dest))
    :effect (and
      (not (ontable ?b))
      (not (clear ?dest))
      (on ?b ?dest)
      (clear ?b)
    )
  )

  (:action vowel-move-from-table-to-table
    :parameters (?b - vowel)
    :precondition (and (ontable ?b) (clear ?b))
    :effect (and
      ;; Create a new table stack for this vowel block.
      ;; In this representation, being on the table is represented only by (ontable ?b).
      ;; If already on table, this action is effectively a no-op but allowed to model
      ;; the explicit "place on table (new stack)" operation.
      (ontable ?b)
      (clear ?b)
    )
  )

  ;; Consonant agent actions: may only move consonant blocks (B,C,D,F,G,H,J,K,L)
  (:action consonant-move-from-on-to-block
    :parameters (?b - consonant ?under - block ?dest - block)
    :precondition (and (on ?b ?under) (clear ?b) (clear ?dest) (different ?b ?dest))
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?dest))
      (on ?b ?dest)
      (clear ?b)
    )
  )

  (:action consonant-move-from-on-to-table
    :parameters (?b - consonant ?under - block)
    :precondition (and (on ?b ?under) (clear ?b))
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (ontable ?b)
      (clear ?b)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?b - consonant ?dest - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?dest) (different ?b ?dest))
    :effect (and
      (not (ontable ?b))
      (not (clear ?dest))
      (on ?b ?dest)
      (clear ?b)
    )
  )

  (:action consonant-move-from-table-to-table
    :parameters (?b - consonant)
    :precondition (and (ontable ?b) (clear ?b))
    :effect (and
      ;; As for vowels, allow explicit "place on table" operation.
      (ontable ?b)
      (clear ?b)
    )
  )
)