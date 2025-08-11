```pddl
(define (domain vault-domain)
  (:requirements :typing :strips)
  (:types robot vault key thing)
  (:predicates
    (closed ?v - vault)
    (open ?v - vault)
    (entrance-small ?v - vault)
    (requires-key ?v - vault ?k - key)
    (has-key ?r - robot ?k - key)
    (small ?r - robot)
    (at ?o - thing ?loc - thing)
    (in ?r - robot ?loc - thing)
    (gripped ?r - robot ?o - thing))
  (:action open-vault
    :parameters (?r - robot ?v - vault ?k - key)
    :precondition (and
                    (closed ?v)
                    (has-key ?r ?k)
                    (requires-key ?v ?k)
                    (entrance-small ?v))
    :effect (and
              (not (closed ?v))
              (open ?v)))
  (:action enter-vault
    :parameters (?r - robot ?v - vault)
    :precondition (and
                    (open ?v)
                    (small ?r))
    :effect (in ?r ?v))
  (:action grab-object
    :parameters (?r - robot ?o - thing ?v - vault)
    :precondition (and
                    (in ?r ?v)
                    (at ?o ?v)
                    (not (gripped ?r ?o)))
    :effect (and
              (gripped ?r ?o)
              (not (at ?o ?v))) ))
```