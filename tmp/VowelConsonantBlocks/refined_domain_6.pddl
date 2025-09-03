(define (domain multi-agent-blocks-classical)
  (:requirements :strips :typing :equality)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (step1) ; symbolic steps for temporal sequence
    (step2)
    (step3)
  )
  (:action move-vowel-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and (vowel ?x) (clear ?x) (clear ?to) (on ?x ?from) (step1))
    :effect (and (not (on ?x ?from)) (on ?x ?to) (not (clear ?to)) (clear ?from) (not (step1)) (step2))
  )
  (:action move-vowel-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and (vowel ?x) (clear ?x) (on ?x ?from) (step2))
    :effect (and (not (on ?x ?from)) (on-table ?x) (clear ?from) (clear ?x) (not (step2)) (step3))
  )
  (:action move-consonant-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and (consonant ?x) (clear ?x) (clear ?to) (on ?x ?from) (step3))
    :effect (and (not (on ?x ?from)) (on ?x ?to) (not (clear ?to)) (clear ?from))
  )
  (:action move-consonant-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and (consonant ?x) (clear ?x) (on ?x ?from) (step1))
    :effect (and (not (on ?x ?from)) (on-table ?x) (clear ?from) (clear ?x))
  )
)