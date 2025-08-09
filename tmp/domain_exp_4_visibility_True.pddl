(define (domain vault-domain)
  (:requirements :typing)
  (:types agent vault key obj)
  (:predicates
     (big ?a - agent)
     (small ?a - agent)
     (closed ?v - vault)
     (open ?v - vault)
     (hasKey ?a - agent ?k - key)
     (keyCanOpen ?k - key ?v - vault)
     (inside ?a - agent ?v - vault)
     (insideObj ?o - obj ?v - vault)
     (grabbed ?a - agent ?o - obj)
  )
  (:action hand-key
    :parameters (?b - agent ?a - agent ?k - key ?v - vault)
    :precondition (and
                      (hasKey ?a ?k)
                      (not (hasKey ?b ?k)))
    :effect (and
              (hasKey ?b ?k)
              (not (hasKey ?a ?k))) )
  (:action open-vault
    :parameters (?a - agent ?k - key ?v - vault)
    :precondition (and
                       (closed ?v)
                       (hasKey ?a ?k)
                       (keyCanOpen ?k ?v))
    :effect (and
                (open ?v)
                (not (closed ?v))) )
  (:action enter-vault
    :parameters (?a - agent ?v - vault)
    :precondition (and
                       (open ?v)
                       (not (big ?a))
                       (not (inside ?a ?v)))
    :effect (and
                (inside ?a ?v)
                (not (inside ?a ?v))) )
  (:action grab
    :parameters (?a - agent ?o - obj ?v - vault)
    :precondition (and
                       (inside ?a ?v)
                       (insideObj ?o ?v)
                       (not (big ?a)))
    :effect (and
                (grabbed ?a ?o)
                (not (insideObj ?o ?v))) )
)