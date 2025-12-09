(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity)

  ;; Canonical predicates (consistent with auditor recommendations)
  (:predicates
    (has-province ?e - entity)     ;; formerly Province(?x)
    (at-planet   ?e - entity)      ;; formerly Planet(?x)
    (in-pain     ?e - entity)      ;; formerly Pain(?x)
    (harmony)                       ;; global Harmony (0-ary predicate)
    (craves      ?s - entity ?t - entity)  ;; craves(subject,target)
    (distinct    ?x - entity ?y - entity)  ;; explicit inequality relation between distinct objects
  )

  ;; Action: Attack
  ;; Preconditions: target has province, is at planet, and global harmony is true.
  ;; Effects: target becomes in-pain; target loses province and planet; global harmony is removed.
  (:action attack-action
    :parameters (?target - entity)
    :precondition (and
                    (has-province ?target)
                    (at-planet ?target)
                    (harmony)
                  )
    :effect (and
              (in-pain ?target)
              (not (has-province ?target))
              (not (at-planet ?target))
              (not (harmony))
            )
  )

  ;; Action: Succumb
  ;; Preconditions: subject is in pain.
  ;; Effects: consumes pain on subject, reinstates province and planet on subject, restores global harmony.
  (:action succumb-action
    :parameters (?subject - entity)
    :precondition (and
                    (in-pain ?subject)
                  )
    :effect (and
              (not (in-pain ?subject))
              (has-province ?subject)
              (at-planet ?subject)
              (harmony)
            )
  )

  ;; Action: Overcome
  ;; Preconditions: object is in pain, other currently has province, and they must be distinct.
  ;; Effects: moves province from other to object (atomic delete/add), consumes pain on object,
  ;;          creates craves(object, other), and establishes global harmony.
  (:action overcome-action
    :parameters (?obj - entity ?other - entity)
    :precondition (and
                    (in-pain ?obj)
                    (has-province ?other)
                    (distinct ?obj ?other)
                  )
    :effect (and
              (not (in-pain ?obj))
              (not (has-province ?other))
              (has-province ?obj)
              (craves ?obj ?other)
              (harmony)
            )
  )

  ;; Action: Feast
  ;; Preconditions: subject craves target, subject holds province, global harmony is true, and distinctness.
  ;; Effects: consumes the craves relation, subject loses province, subject acquires pain,
  ;;          target gains province, and global harmony is removed.
  (:action feast-action
    :parameters (?subject - entity ?target - entity)
    :precondition (and
                    (craves ?subject ?target)
                    (has-province ?subject)
                    (harmony)
                    (distinct ?subject ?target)
                  )
    :effect (and
              (not (craves ?subject ?target))
              (not (has-province ?subject))
              (has-province ?target)
              (in-pain ?subject)
              (not (harmony))
            )
  )
)