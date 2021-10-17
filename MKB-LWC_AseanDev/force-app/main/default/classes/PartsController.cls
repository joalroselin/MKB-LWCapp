public with sharing class PartsController {
    // static Integer PAGE_SIZE = 3;

    // public class Filters {
    //     @AuraEnabled
    //     public String searchKey { get; set; }
    //     @AuraEnabled
    //     public String[] layouts { get; set; }
    //     @AuraEnabled
    //     public String[] materials { get; set; }
    //     // @AuraEnabled
    //     // public Bool inStock { get; set; }
    // }

    // @AuraEnabled
    // public static PagedResult getProducts(Filters filters, Integer pageNumber) {
    //     String key, whereClause = '';
    //     String[] layouts, materials, criteria = new List<String>{};
    //     // Bool inStock;

    //     if (filters != null) {
    //         maxPrice = filters.maxPrice;
    //         materials = filters.materials;
    //         profiles = filters.layouts;
    //         if (!String.isEmpty(filters.searchKey)) {
    //             key = '%' + filters.searchKey + '%';
    //             criteria.add('Name LIKE :key');
    //         }
    //         if (filters.layouts != null) {
    //         layouts = filters.layouts;
    //             criteria.add('Layout__c IN :layouts');
    //         }
    //         if (filters.materials != null) {
    //             materials = filters.materials;
    //             criteria.add('Material__c IN :materials');
    //         }
    //         if (criteria.size() > 0) {
    //             whereClause = 'WHERE ' + String.join(criteria, ' AND ');
    //         }
    //     }

    //     Integer pageSize = PartsController.PAGE_SIZE;
    //     Integer offset = (pageNumber - 1) * pageSize;
    //     PagedResult result = new PagedResult();
    //     result.pageSize = pageSize;
    //     result.pageNumber = pageNumber;
    //     result.totalItemCount = Database.countQuery(
    //         'Select count() FROM Product__c ' + whereClause
    //     );
    //     result.records = Database.query(
    //         'Select Id, Name, Material__c, Layout__c, Quantity__c, In_Stock__c, Price__c FROM MKB_Board__c ' whereClause +
    //         ' WITH SECURITY_ENFORCED' +
    //         ' ORDER BY Name LIMIT :pageSize OFFSET :offset'
    //     );
    //     return result;
    // }

    @AuraEnabled(Cacheable=true)
    public static MKB_Board__c[] getAllBoards(Id boardId) {
        return [
            SELECT
                Id,
                Name,
                Layout__c,
                Material__c,
                PCB__c,
                Plate__c,
                Price__c,
                Quantity__c,
                Vendor__r.Name,
                Keys__c,
                In_Stock__c
            FROM MKB_Board__c
            WHERE Id != :boardId
            WITH SECURITY_ENFORCED
        ];
    }

    // @AuraEnabled(Cacheable=true)
    // public static MKB_Switch__c[] getAllSwitches() {
    //     return [
    //         SELECT
    //             Id,
    //             Name,
    //             Brand__c,
    //             Type__c
    //             Price_Per_10__c,
    //             Stem_Compatibility__c,
    //             Quantity__c,
    //             In_Stock__c,
    //             Vendor__r.Name,
    //             Actuation_Force__c,
    //             Actuation_Point__c,
    //             Bottom_Out_Force__c,
    //             Bottom_Out_Travel__c
    //         FROM MKB_Switch__c
    //         ORDER BY Brand__c
    //         LIMIT 20
    //     ];
    // }

    @AuraEnabled(Cacheable=true)
    public static MKB_Keycaps__c[] getAllKeycaps() {
        return [
            SELECT
                Id,
                Name,
                Profile__c,
                Manufacturer__c,
                Available_Layouts__c,
                Quantity__c,
                In_Stock__c,
                Vendor__r.Name,
                Price__c
            FROM MKB_Keycaps__c
            ORDER BY Manufacturer__c
            LIMIT 20
        ];
    }

    @AuraEnabled(Cacheable=true)
    public static MKB_Accessory__c[] getAllAccessories() {
        return [
            SELECT
                Id,
                Name,
                Type__c,
                Quantity__c,
                Price__c,
                In_Stock__c,
                Vendor__r.Name
            FROM MKB_Accessory__c
            ORDER BY Type__c
            LIMIT 20
        ];
    }

    @AuraEnabled(Cacheable=true)
    public static MKB_Vendor__c[] getAllVendors() {
        return [
            SELECT
                Id,
                Name,
                Catalogue__c,
                Website__c
            FROM MKB_Vendor__c
            ORDER BY Name
            LIMIT 20
        ];
    }

    // @api searchBarIsVisible = false;
    // @api tilesAreDraggable = false;
    // pageNumber = 1;
    // pageSize;
    // totalItemCount = 0;
    // filters = {};
    // @wire(MessageContext) messageContext;
    // productFilterSubscription;
    // @wire(getProducts, { filters: '$filters', pageNumber: '$pageNumber' })
    // products;

    // connectedCallback() {
    //     // Subscribe to ProductsFiltered message
    //     this.productFilterSubscription = subscribe(
    //         this.messageContext,
    //         PRODUCTS_FILTERED_MESSAGE,
    //         (message) => this.handleFilterChange(message)
    //     );
    // }

    // handleProductSelected(event) {
    //     // Published ProductSelected message
    //     publish(this.messageContext, PRODUCT_SELECTED_MESSAGE, {
    //         productId: event.detail
    //     });
    // }

    // handleSearchKeyChange(event) {
    //     this.filters = {
    //         searchKey: event.target.value.toLowerCase()
    //     };
    //     this.pageNumber = 1;
    // }

    // handleFilterChange(message) {
    //     this.filters = { ...message.filters };
    //     this.pageNumber = 1;
    // }

    // handlePreviousPage() {
    //     this.pageNumber = this.pageNumber - 1;
    // }

    // handleNextPage() {
    //     this.pageNumber = this.pageNumber + 1;
    // }
}
