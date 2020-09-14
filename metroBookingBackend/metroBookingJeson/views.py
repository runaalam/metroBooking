from django.http import JsonResponse

def route_list_json(request):

    data = [{'id': 1, 'routeName': 'New Delhi', 'routeType': ['Orange'], 'isInterchange': False, 'connectRoute': ['Rajiv Chowk']},
            {'id': 2, 'routeName': 'Rajiv Chowk', 'routeType': ['Orange', 'blue'], 'isInterchange': True, 'connectRoute': ['Mandi House']},
            {'id': 3, 'routeName': 'Patel Chowk', 'routeType': ['Orange'], 'isInterchange': False, 'connectRoute': ['Rajiv Chowk']},
            {'id': 4, 'routeName': 'INA', 'routeType': ['Orange'], 'isInterchange': False, 'connectRoute': ['Rajiv Chowk']},
            {'id': 5, 'routeName': 'Karol Bagh', 'routeType': ['Blue'], 'isInterchange': False, 'connectRoute': ['Rajiv Chowk', 'Mandi House']},
            {'id': 6, 'routeName': 'Jande Walan', 'routeType': ['Blue'], 'isInterchange': False, 'connectRoute': ['Rajiv Chowk', 'Mandi House']},
            {'id': 7, 'routeName': 'Rk Ashram', 'routeType': ['Blue'], 'isInterchange': False, 'connectRoute': ['Rajiv Chowk', 'Mandi House']},
            {'id': 8, 'routeName': 'Barak Amba', 'routeType': ['Blue'], 'isInterchange': False, 'connectRoute': ['Rajiv Chowk', 'Mandi House']},
            {'id': 9, 'routeName': 'Mandi House', 'routeType': ['Blue', 'Green'], 'isInterchange': True, 'connectRoute': ['Rajiv Chowk']},
            {'id': 10, 'routeName': 'Okhla', 'routeType': ['Green'], 'isInterchange': False, 'connectRoute': ['Mandi House']}
            ]
    return JsonResponse(data, safe=False)

def routeType_list_json(request):
        data = ['Orange', 'Blue', 'Green']
        return JsonResponse(data, safe=False)
