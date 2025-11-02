(define (domain multi_agent_block_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types block support) ;; support covers table (a support object); blocks sit on supports

  (:predicates
    (on ?x - block ?y - support)        ;; block x is on support y (support = block or table)
    (clear ?x - block)                 ;; nothing on top of block x
    (holding-v ?x - block)             ;; vowel agent is holding block x
    (holding-c ?x - block)             ;; consonant agent is holding block x
    (handempty-v)                      ;; vowel agent's hand empty
    (handempty-c)                      ;; consonant agent's hand empty
    (vowel ?x - block)                 ;; block x is vowel-agent-handlable
    (consonant ?x - block)             ;; block x is consonant-agent-handlable
  )

  ;; Vowel-agent: pick up a vowel block from the table
  (:action vowel-pickup-from-table
    :parameters (?b - block ?t - support)
    :precondition (and (vowel ?b) (on ?b ?t) (clear ?b) (handempty-v) (not (on ?b ?b))) ;; extra tautology to keep consistent
    :effect (and
      (not (on ?b ?t))
      (holding-v ?b)
      (not (clear ?b))
      (not (handempty-v))
    )
  )

  ;; Vowel-agent: unstack a vowel block from on top of another block (support is a block)
  (:action vowel-unstack
    :parameters (?b - block ?s - block)
    :precondition (and (vowel ?b) (on ?b ?s) (clear ?b) (handempty-v))
    :effect (and
      (not (on ?b ?s))
      (holding-v ?b)
      (clear ?s)
      (not (clear ?b))
      (not (handempty-v))
    )
  )

  ;; Vowel-agent: put down held vowel block on table
  (:action vowel-putdown-on-table
    :parameters (?b - block ?t - support)
    :precondition (and (vowel ?b) (holding-v ?b))
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (holding-v ?b))
      (handempty-v)
    )
  )

  ;; Vowel-agent: stack a held vowel block onto a clear block
  (:action vowel-stack-on-block
    :parameters (?b - block ?s - block)
    :precondition (and (vowel ?b) (holding-v ?b) (clear ?s) (not (on ?b ?s)))
    :effect (and
      (on ?b ?s)
      (not (clear ?s))
      (clear ?b)
      (not (holding-v ?b))
      (handempty-v)
    )
  )

  ;; Consonant-agent: pick up a consonant block from the table
  (:action cons-pickup-from-table
    :parameters (?b - block ?t - support)
    :precondition (and (consonant ?b) (on ?b ?t) (clear ?b) (handempty-c))
    :effect (and
      (not (on ?b ?t))
      (holding-c ?b)
      (not (clear ?b))
      (not (handempty-c))
    )
  )

  ;; Consonant-agent: unstack a consonant block from on top of another block
  (:action cons-unstack
    :parameters (?b - block ?s - block)
    :precondition (and (consonant ?b) (on ?b ?s) (clear ?b) (handempty-c))
    :effect (and
      (not (on ?b ?s))
      (holding-c ?b)
      (clear ?s)
      (not (clear ?b))
      (not (handempty-c))
    )
  )

  ;; Consonant-agent: put down held consonant block on table
  (:action cons-putdown-on-table
    :parameters (?b - block ?t - support)
    :precondition (and (consonant ?b) (holding-c ?b))
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (holding-c ?b))
      (handempty-c)
    )
  )

  ;; Consonant-agent: stack a held consonant block onto a clear block
  (:action cons-stack-on-block
    :parameters (?b - block ?s - block)
    :precondition (and (consonant ?b) (holding-c ?b) (clear ?s) (not (on ?b ?s)))
    :effect (and
      (on ?b ?s)
      (not (clear ?s))
      (clear ?b)
      (not (holding-c ?b))
      (handempty-c)
    )
  )
)