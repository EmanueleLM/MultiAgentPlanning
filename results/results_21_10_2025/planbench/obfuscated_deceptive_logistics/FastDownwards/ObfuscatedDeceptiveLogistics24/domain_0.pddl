(define (domain orchestrated-domain)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (spring ?o - object)
    (next ?a ?b - object)
    (collect ?a ?b - object)
  )

  ;; paltry: requires hand, cats, texture, vase and at least one next relation;
  ;; it adds a chosen next relation and clears a vase on a specified object.
  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?v - object
                 ?pre_s - object ?pre_t - object
                 ?add_s - object ?add_t - object)
    :precondition (and
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (vase ?v)
                    (next ?pre_s ?pre_t)
                  )
    :effect (and
              (next ?add_s ?add_t)
              (not (vase ?v))
            )
  )

  ;; sip: requires hand, cats, texture and two next relations;
  ;; it makes a vase true on a chosen object and deletes one of the provided next relations.
  (:action sip
    :parameters (?h - object ?c - object ?t - object
                 ?n1s - object ?n1t - object
                 ?n2s - object ?n2t - object
                 ?v - object)
    :precondition (and
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (next ?n1s ?n1t)
                    (next ?n2s ?n2t)
                  )
    :effect (and
              (vase ?v)
              (not (next ?n2s ?n2t))
            )
  )

  ;; clip: similar to sip but uses sneeze instead of cats in the preconditions.
  (:action clip
    :parameters (?h - object ?snee - object ?t - object
                 ?n1s - object ?n1t - object
                 ?n2s - object ?n2t - object
                 ?v - object)
    :precondition (and
                    (hand ?h)
                    (sneeze ?snee)
                    (texture ?t)
                    (next ?n1s ?n1t)
                    (next ?n2s ?n2t)
                  )
    :effect (and
              (vase ?v)
              (not (next ?n2s ?n2t))
            )
  )

  ;; wretched: requires sneeze, texture, stupendous, at least one next and at least one collect;
  ;; it adds a next relation and deletes another next relation.
  (:action wretched
    :parameters (?snee - object ?t - object ?stu - object
                 ?coll_s - object ?coll_t - object
                 ?pre_s - object ?pre_t - object
                 ?add_s - object ?add_t - object
                 ?del_s - object ?del_t - object)
    :precondition (and
                    (sneeze ?snee)
                    (texture ?t)
                    (stupendous ?stu)
                    (collect ?coll_s ?coll_t)
                    (next ?pre_s ?pre_t)
                  )
    :effect (and
              (next ?add_s ?add_t)
              (not (next ?del_s ?del_t))
            )
  )

  ;; memory: requires cats, spring and at least one next relation;
  ;; it adds a next relation and removes another next relation.
  (:action memory
    :parameters (?cats - object ?spr - object
                 ?pre_s - object ?pre_t - object
                 ?add_s - object ?add_t - object
                 ?del_s - object ?del_t - object)
    :precondition (and
                    (cats ?cats)
                    (spring ?spr)
                    (next ?pre_s ?pre_t)
                  )
    :effect (and
              (next ?add_s ?add_t)
              (not (next ?del_s ?del_t))
            )
  )

  ;; tightfisted: requires hand, sneeze, texture, vase and at least one next relation;
  ;; it adds a next relation and clears the required vase.
  (:action tightfisted
    :parameters (?h - object ?snee - object ?t - object ?v - object
                 ?pre_s - object ?pre_t - object
                 ?add_s - object ?add_t - object)
    :precondition (and
                    (hand ?h)
                    (sneeze ?snee)
                    (texture ?t)
                    (vase ?v)
                    (next ?pre_s ?pre_t)
                  )
    :effect (and
              (next ?add_s ?add_t)
              (not (vase ?v))
            )
  )

)