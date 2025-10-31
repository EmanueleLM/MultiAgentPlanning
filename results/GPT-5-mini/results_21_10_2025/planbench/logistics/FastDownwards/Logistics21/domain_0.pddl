(define (domain orchestration)
  :requirements :strips :typing :negative-preconditions
  :types agent item container obj
  :predicates
    (has_item ?a - agent ?i - item)
    (has_container ?a - agent ?c - container)
    (item_small ?i - item)
    (contains_liquid ?c - container)
    (empty ?c - container)
    (thirsty ?a - agent)
    (sipped ?a - agent ?c - container)
    (clipped ?o - obj)
    (remembered ?a - agent ?o - obj)
    (wretched ?o - obj)
    (tightfisted ?a - agent)
  ;; Actions attributed to planner_a (suffix _a)
  (:action paltry_a
    :parameters (?giver - agent ?receiver - agent ?i - item)
    :precondition (and
                    (has_item ?giver ?i)
                    (item_small ?i)
                    (not (has_item ?receiver ?i))
                    (not (tightfisted ?giver))
                  )
    :effect (and
              (not (has_item ?giver ?i))
              (has_item ?receiver ?i)
            )
  )

  (:action sip_a
    :parameters (?drinker - agent ?c - container)
    :precondition (and
                    (has_container ?drinker ?c)
                    (contains_liquid ?c)
                    (not (empty ?c))
                    (thirsty ?drinker)
                  )
    :effect (and
              (sipped ?drinker ?c)
              (empty ?c)
              (not (contains_liquid ?c))
              (not (thirsty ?drinker))
            )
  )

  (:action clip_a
    :parameters (?actor - agent ?o - obj ?clipitem - item)
    :precondition (and
                    (has_item ?actor ?clipitem)
                    (not (clipped ?o))
                  )
    :effect (and
              (clipped ?o)
              (not (has_item ?actor ?clipitem))
            )
  )

  ;; Actions attributed to planner_b (suffix _b)
  (:action wretched_b
    :parameters (?actor - agent ?o - obj)
    :precondition (and
                    (not (wretched ?o))
                  )
    :effect (wretched ?o)
  )

  (:action memory_b
    :parameters (?actor - agent ?o - obj)
    :precondition (and
                    (not (remembered ?actor ?o))
                  )
    :effect (remembered ?actor ?o)
  )

  (:action tightfisted_b
    :parameters (?actor - agent)
    :precondition (and
                    (not (tightfisted ?actor))
                  )
    :effect (tightfisted ?actor)
  )
)