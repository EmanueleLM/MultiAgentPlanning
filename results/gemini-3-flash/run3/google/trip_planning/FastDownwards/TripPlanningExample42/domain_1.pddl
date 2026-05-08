(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (in_friend_window ?d - day)
    (not_in_friend_window ?d - day)
    (is_paris ?c - city)
  )

  ;; Action for staying in a city within the friend window (Days 1-4).
  ;; The traveler must be in Paris during this window.
  (:action stay_in_window
    :parameters (?c - city ?d - day ?dn - day ?npre - count ?npost - count)
    :precondition (and 
      (current_day ?d) 
      (next_day ?d ?dn) 
      (at ?c) 
      (in_friend_window ?d) 
      (is_paris ?c)
      (stay_count ?c ?npre) 
      (next_count ?npre ?npost)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?dn)
      (not (stay_count ?c ?npre)) 
      (stay_count ?c ?npost)
    )
  )

  ;; Action for flying between cities within the friend window (Days 1-4).
  ;; The traveler must be in Paris at the start of the day.
  ;; Travel days count for both the origin and the destination cities.
  (:action fly_in_window
    :parameters (?cf - city ?ct - city ?d - day ?dn - day ?nfpre - count ?nfpost - count ?ntpre - count ?ntpost - count)
    :precondition (and 
      (current_day ?d) 
      (next_day ?d ?dn) 
      (at ?cf) 
      (in_friend_window ?d) 
      (is_paris ?cf) 
      (can_fly ?cf ?ct)
      (stay_count ?cf ?nfpre) 
      (next_count ?nfpre ?nfpost)
      (stay_count ?ct ?ntpre) 
      (next_count ?ntpre ?ntpost)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?dn)
      (not (at ?cf)) 
      (at ?ct)
      (not (stay_count ?cf ?nfpre)) 
      (stay_count ?cf ?nfpost)
      (not (stay_count ?ct ?ntpre)) 
      (stay_count ?ct ?ntpost)
    )
  )

  ;; Action for staying in a city after the friend window (Day 5 onwards).
  (:action stay_out_of_window
    :parameters (?c - city ?d - day ?dn - day ?npre - count ?npost - count)
    :precondition (and 
      (current_day ?d) 
      (next_day ?d ?dn) 
      (at ?c) 
      (not_in_friend_window ?d)
      (stay_count ?c ?npre) 
      (next_count ?npre ?npost)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?dn)
      (not (stay_count ?c ?npre)) 
      (stay_count ?c ?npost)
    )
  )

  ;; Action for flying between cities after the friend window (Day 5 onwards).
  ;; Travel days count for both the origin and the destination cities.
  (:action fly_out_of_window
    :parameters (?cf - city ?ct - city ?d - day ?dn - day ?nfpre - count ?nfpost - count ?ntpre - count ?ntpost - count)
    :precondition (and 
      (current_day ?d) 
      (next_day ?d ?dn) 
      (at ?cf) 
      (not_in_friend_window ?d) 
      (can_fly ?cf ?ct)
      (stay_count ?cf ?nfpre) 
      (next_count ?nfpre ?nfpost)
      (stay_count ?ct ?ntpre) 
      (next_count ?ntpre ?ntpost)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?dn)
      (not (at ?cf)) 
      (at ?ct)
      (not (stay_count ?cf ?nfpre)) 
      (stay_count ?cf ?nfpost)
      (not (stay_count ?ct ?ntpre)) 
      (stay_count ?ct ?ntpost)
    )
  )
)